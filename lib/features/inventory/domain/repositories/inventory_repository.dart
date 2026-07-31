import '../../../../core/utils/result.dart';
import '../entities/inventory_item.dart';

abstract class InventoryRepository {
  Future<Result<List<InventoryItem>>> getInventoryItems();
  Future<Result<InventoryItem>> updateStock(String id, int delta);
  Future<Result<InventoryItem>> addInventoryItem(InventoryItem item);
}
