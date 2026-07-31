import '../../../../core/utils/result.dart';
import '../entities/inventory_item.dart';
import '../repositories/inventory_repository.dart';

class GetInventoryItems {
  final InventoryRepository repository;

  const GetInventoryItems(this.repository);

  Future<Result<List<InventoryItem>>> execute() {
    return repository.getInventoryItems();
  }
}
