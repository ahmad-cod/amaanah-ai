import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/isar_provider.dart';
import '../../data/datasources/shipment_local_datasource.dart';
import '../../data/repositories/shipment_repository_impl.dart';
import '../../domain/entities/shipment.dart';
import '../../domain/repositories/shipment_repository.dart';
import '../../domain/usecases/create_shipment.dart';
import '../../domain/usecases/get_shipments.dart';

// Dependency Injection Providers
final shipmentLocalDatasourceProvider = Provider<ShipmentLocalDatasource>((ref) {
  final isar = ref.watch(isarProvider);
  return ShipmentLocalDatasourceImpl(isar);
});

final shipmentRepositoryProvider = Provider<ShipmentRepository>((ref) {
  final localDatasource = ref.watch(shipmentLocalDatasourceProvider);
  return ShipmentRepositoryImpl(localDatasource: localDatasource);
});

final getShipmentsUseCaseProvider = Provider<GetShipments>((ref) {
  final repository = ref.watch(shipmentRepositoryProvider);
  return GetShipments(repository);
});

final createShipmentUseCaseProvider = Provider<CreateShipment>((ref) {
  final repository = ref.watch(shipmentRepositoryProvider);
  return CreateShipment(repository);
});

// Modern Riverpod 2.x AsyncNotifier Provider
class ShipmentsNotifier extends AsyncNotifier<List<Shipment>> {
  @override
  Future<List<Shipment>> build() async {
    return _fetchShipments();
  }

  Future<List<Shipment>> _fetchShipments() async {
    final useCase = ref.read(getShipmentsUseCaseProvider);
    final result = await useCase.execute();
    return result.fold(
      onSuccess: (data) => data,
      onFailure: (failure) => throw Exception(failure.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchShipments());
  }

  Future<bool> addShipment(Shipment shipment) async {
    final useCase = ref.read(createShipmentUseCaseProvider);
    final result = await useCase.execute(shipment);
    
    return result.fold(
      onSuccess: (created) {
        state = AsyncValue.data([created, ...?state.value]);
        return true;
      },
      onFailure: (_) => false,
    );
  }

  Future<void> updateStatus(String id, ShipmentStatus newStatus) async {
    final repository = ref.read(shipmentRepositoryProvider);
    final result = await repository.updateShipmentStatus(id, newStatus);
    
    result.fold(
      onSuccess: (updated) {
        state = AsyncValue.data([
          for (final item in state.value ?? <Shipment>[])
            if (item.id == id) updated else item
        ]);
      },
      onFailure: (_) {},
    );
  }
}

final shipmentsProvider = AsyncNotifierProvider<ShipmentsNotifier, List<Shipment>>(
  ShipmentsNotifier.new,
);
