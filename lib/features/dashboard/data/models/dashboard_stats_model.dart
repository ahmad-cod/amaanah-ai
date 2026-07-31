import '../../domain/entities/dashboard_stats.dart';

class DashboardStatsModel {
  final int activeShipmentsCount;
  final int deliveredTodayCount;
  final int pendingWarehousingCount;
  final int lowStockAlertsCount;

  const DashboardStatsModel({
    required this.activeShipmentsCount,
    required this.deliveredTodayCount,
    required this.pendingWarehousingCount,
    required this.lowStockAlertsCount,
  });

  DashboardStats toEntity() {
    return DashboardStats(
      activeShipmentsCount: activeShipmentsCount,
      deliveredTodayCount: deliveredTodayCount,
      pendingWarehousingCount: pendingWarehousingCount,
      lowStockAlertsCount: lowStockAlertsCount,
    );
  }
}
