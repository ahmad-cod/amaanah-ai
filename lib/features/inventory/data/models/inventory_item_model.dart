import '../../domain/entities/inventory_item.dart';

class InventoryItemModel {
  final String id;
  final String sku;
  final String name;
  final String category;
  final int quantity;
  final int reorderLevel;
  final String warehouseZone;
  final String lastUpdated;

  const InventoryItemModel({
    required this.id,
    required this.sku,
    required this.name,
    required this.category,
    required this.quantity,
    required this.reorderLevel,
    required this.warehouseZone,
    required this.lastUpdated,
  });

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) {
    return InventoryItemModel(
      id: json['id'] as String,
      sku: json['sku'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      quantity: json['quantity'] as int,
      reorderLevel: json['reorderLevel'] as int,
      warehouseZone: json['warehouseZone'] as String,
      lastUpdated: json['lastUpdated'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'name': name,
      'category': category,
      'quantity': quantity,
      'reorderLevel': reorderLevel,
      'warehouseZone': warehouseZone,
      'lastUpdated': lastUpdated,
    };
  }

  InventoryItem toEntity() {
    return InventoryItem(
      id: id,
      sku: sku,
      name: name,
      category: category,
      quantity: quantity,
      reorderLevel: reorderLevel,
      warehouseZone: warehouseZone,
      lastUpdated: DateTime.parse(lastUpdated),
    );
  }
}
