class InventoryItem {
  final String id;
  final String sku;
  final String name;
  final String category;
  final int quantity;
  final int reorderLevel;
  final String warehouseZone;
  final DateTime lastUpdated;

  const InventoryItem({
    required this.id,
    required this.sku,
    required this.name,
    required this.category,
    required this.quantity,
    required this.reorderLevel,
    required this.warehouseZone,
    required this.lastUpdated,
  });

  bool get isLowStock => quantity <= reorderLevel;

  InventoryItem copyWith({
    String? id,
    String? sku,
    String? name,
    String? category,
    int? quantity,
    int? reorderLevel,
    String? warehouseZone,
    DateTime? lastUpdated,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      name: name ?? this.name,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      reorderLevel: reorderLevel ?? this.reorderLevel,
      warehouseZone: warehouseZone ?? this.warehouseZone,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
