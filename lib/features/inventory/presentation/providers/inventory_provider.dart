import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/isar_provider.dart';
import '../../data/datasources/inventory_local_datasource.dart';
import '../../data/repositories/inventory_repository_impl.dart';
import '../../domain/entities/inventory_item.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../../domain/usecases/get_inventory_items.dart';
import '../../domain/usecases/update_stock.dart';

final inventoryLocalDatasourceProvider = Provider<InventoryLocalDatasource>((ref) {
  final isar = ref.watch(isarProvider);
  return InventoryLocalDatasourceImpl(isar);
});

final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  final localDatasource = ref.watch(inventoryLocalDatasourceProvider);
  return InventoryRepositoryImpl(localDatasource: localDatasource);
});

final getInventoryItemsUseCaseProvider = Provider<GetInventoryItems>((ref) {
  final repository = ref.watch(inventoryRepositoryProvider);
  return GetInventoryItems(repository);
});

final updateStockUseCaseProvider = Provider<UpdateStock>((ref) {
  final repository = ref.watch(inventoryRepositoryProvider);
  return UpdateStock(repository);
});

class InventoryNotifier extends AsyncNotifier<List<InventoryItem>> {
  @override
  Future<List<InventoryItem>> build() async {
    return _fetchItems();
  }

  Future<List<InventoryItem>> _fetchItems() async {
    final useCase = ref.read(getInventoryItemsUseCaseProvider);
    final result = await useCase.execute();
    return result.fold(
      onSuccess: (items) => items,
      onFailure: (failure) => throw Exception(failure.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchItems());
  }

  Future<void> updateStock(String id, int delta) async {
    final useCase = ref.read(updateStockUseCaseProvider);
    final result = await useCase.execute(id, delta);

    result.fold(
      onSuccess: (updated) {
        state = AsyncValue.data([
          for (final item in state.value ?? <InventoryItem>[])
            if (item.id == id) updated else item
        ]);
      },
      onFailure: (_) {},
    );
  }
}

final inventoryProvider = AsyncNotifierProvider<InventoryNotifier, List<InventoryItem>>(
  InventoryNotifier.new,
);
