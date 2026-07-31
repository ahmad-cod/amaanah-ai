import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'app.dart';
import 'lib/core/database/isar_provider.dart';
import 'lib/core/database/isar_service.dart';
import 'lib/features/inventory/data/datasources/db/schemas/inventory_schema.dart';
import 'lib/features/shipments/data/datasources/db/schemas/shipment_schema.dart';

void main() async {
  // Ensure Flutter engine bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Asynchronously initialize local Isar database before launching app UI
  final isar = await IsarService.init();

  // Seed sample offline data if database is brand new
  await _seedInitialDataIfNeeded(isar);

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const AmaanahApp(),
    ),
  );
}

Future<void> _seedInitialDataIfNeeded(Isar isar) async {
  final countShipments = await isar.shipmentSchemas.count();
  if (countShipments == 0) {
    await isar.writeTxn(() async {
      final s1 = ShipmentSchema()
        ..uuid = 'shipment-001'
        ..trackingNumber = 'AMN-849201'
        ..sender = 'Atlas Logistics Hub'
        ..recipient = 'Horizon Retailers'
        ..origin = 'Dock 4, Lagos Central'
        ..destination = 'Warehouse B, Ibadan'
        ..status = 'inTransit'
        ..createdAt = DateTime.now().subtract(const Duration(hours: 14))
        ..estimatedDelivery = DateTime.now().add(const Duration(days: 1))
        ..notes = 'Fragile electronics. Keep dry.';

      final s2 = ShipmentSchema()
        ..uuid = 'shipment-002'
        ..trackingNumber = 'AMN-938210'
        ..sender = 'Zenith Supplies'
        ..recipient = 'Kano Distribution Center'
        ..origin = 'Port Depot, Port Harcourt'
        ..destination = 'Industrial Zone, Kano'
        ..status = 'pending'
        ..createdAt = DateTime.now().subtract(const Duration(hours: 2))
        ..estimatedDelivery = DateTime.now().add(const Duration(days: 3))
        ..notes = 'Perishable items. Priority routing.';

      await isar.shipmentSchemas.putAll([s1, s2]);
    });
  }

  final countInventory = await isar.inventorySchemas.count();
  if (countInventory == 0) {
    await isar.writeTxn(() async {
      final i1 = InventorySchema()
        ..uuid = 'inv-001'
        ..sku = 'PALLET-LOG-01'
        ..name = 'Heavy Duty Wooden Pallets'
        ..category = 'Storage'
        ..quantity = 42
        ..reorderLevel = 10
        ..warehouseZone = 'Zone A-2'
        ..lastUpdated = DateTime.now();

      final i2 = InventorySchema()
        ..uuid = 'inv-002'
        ..sku = 'SEAL-SEC-99'
        ..name = 'Tamper-Evident Cargo Seals'
        ..category = 'Security'
        ..quantity = 4
        ..reorderLevel = 15
        ..warehouseZone = 'Zone C-1'
        ..lastUpdated = DateTime.now();

      await isar.inventorySchemas.putAll([i1, i2]);
    });
  }
}
