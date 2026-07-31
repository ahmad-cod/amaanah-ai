import 'package:isar/isar.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../shipments/data/datasources/db/schemas/shipment_schema.dart';
import '../../../inventory/data/datasources/db/schemas/inventory_schema.dart';
import '../models/dashboard_stats_model.dart';

abstract class DashboardLocalDatasource {
  Future<DashboardStatsModel> getStats();
}

class DashboardLocalDatasourceImpl implements DashboardLocalDatasource {
  final Isar isar;

  DashboardLocalDatasourceImpl(this.isar);

  @override
  Future<DashboardStatsModel> getStats() async {
    try {
      final totalShipments = await isar.shipmentSchemas.count();
      final inTransitCount = await isar.shipmentSchemas
          .filter()
          .statusEqualTo('inTransit')
          .count();
      final deliveredCount = await isar.shipmentSchemas
          .filter()
          .statusEqualTo('delivered')
          .count();
      final pendingCount = await isar.shipmentSchemas
          .filter()
          .statusEqualTo('pending')
          .count();

      final inventoryItems = await isar.inventorySchemas.where().findAll();
      final lowStockCount = inventoryItems.where((item) => item.quantity <= item.reorderLevel).length;

      return DashboardStatsModel(
        activeShipmentsCount: inTransitCount > 0 ? inTransitCount : totalShipments,
        deliveredTodayCount: deliveredCount,
        pendingWarehousingCount: pendingCount,
        lowStockAlertsCount: lowStockCount,
      );
    } catch (e) {
      throw DatabaseException('Failed to calculate dashboard statistics: $e');
    }
  }
}
