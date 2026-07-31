import 'package:isar/isar.dart';
import '../../../../core/errors/exceptions.dart';
import 'db/schemas/inventory_schema.dart';

abstract class InventoryLocalDatasource {
  Future<List<InventorySchema>> getInventoryItems();
  Future<InventorySchema?> getItemById(String id);
  Future<InventorySchema> saveItem(InventorySchema item);
}

class InventoryLocalDatasourceImpl implements InventoryLocalDatasource {
  final Isar isar;

  InventoryLocalDatasourceImpl(this.isar);

  @override
  Future<List<InventorySchema>> getInventoryItems() async {
    try {
      return await isar.inventorySchemas.where().findAll();
    } catch (e) {
      throw DatabaseException('Failed to fetch inventory: $e');
    }
  }

  @override
  Future<InventorySchema?> getItemById(String id) async {
    try {
      return await isar.inventorySchemas.filter().uuidEqualTo(id).findFirst();
    } catch (e) {
      throw DatabaseException('Failed to fetch inventory item: $e');
    }
  }

  @override
  Future<InventorySchema> saveItem(InventorySchema item) async {
    try {
      await isar.writeTxn(() async {
        await isar.inventorySchemas.put(item);
      });
      return item;
    } catch (e) {
      throw DatabaseException('Failed to save inventory item: $e');
    }
  }
}
