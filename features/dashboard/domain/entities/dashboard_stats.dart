class DashboardStats {
  final int activeShipmentsCount;
  final int deliveredTodayCount;
  final int pendingWarehousingCount;
  final int lowStockAlertsCount;

  const DashboardStats({
    required this.activeShipmentsCount,
    required this.deliveredTodayCount,
    required this.pendingWarehousingCount,
    required this.lowStockAlertsCount,
  });
}
