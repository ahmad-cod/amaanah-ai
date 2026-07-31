import '../../../../core/utils/result.dart';
import '../entities/inventory_item.dart';
import '../repositories/inventory_repository.dart';

class UpdateStock {
  final InventoryRepository repository;

  const UpdateStock(this.repository);

  Future<Result<InventoryItem>> execute(String id, int delta) {
    return repository.updateStock(id, delta);
  }
}
