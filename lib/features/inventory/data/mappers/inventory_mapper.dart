import '../../domain/entities/inventory_item.dart';
import '../datasources/db/schemas/inventory_schema.dart';

extension InventorySchemaX on InventorySchema {
  InventoryItem toDomain() {
    return InventoryItem(
      id: uuid,
      sku: sku,
      name: name,
      category: category,
      quantity: quantity,
      reorderLevel: reorderLevel,
      warehouseZone: warehouseZone,
      lastUpdated: lastUpdated,
    );
  }
}

extension InventoryDomainX on InventoryItem {
  InventorySchema toSchema() {
    final schema = InventorySchema()
      ..uuid = id
      ..sku = sku
      ..name = name
      ..category = category
      ..quantity = quantity
      ..reorderLevel = reorderLevel
      ..warehouseZone = warehouseZone
      ..lastUpdated = lastUpdated;
    return schema;
  }
}
