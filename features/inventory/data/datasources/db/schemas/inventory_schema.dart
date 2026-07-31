import 'package:isar/isar.dart';

part 'inventory_schema.g.dart';

@collection
class InventorySchema {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String uuid;

  late String sku;
  late String name;
  late String category;
  late int quantity;
  late int reorderLevel;
  late String warehouseZone;
  late DateTime lastUpdated;
}
