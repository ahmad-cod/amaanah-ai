import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/metric_card.dart';
import '../widgets/quick_actions_widget.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.dashboardTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(dashboardProvider.notifier).refresh(),
          ),
        ],
      ),
      body: statsState.when(
        loading: () => const LoadingIndicator(message: 'Gathering logistics intelligence...'),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (stats) {
          return RefreshIndicator(
            onRefresh: () => ref.read(dashboardProvider.notifier).refresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Tagline Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primaryDark, AppColors.primary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.psychology, color: Colors.white, size: 24),
                            const SizedBox(width: 8),
                            Text(
                              AppStrings.appName,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          AppStrings.appTagline,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.white.withOpacity(0.9),
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    'Key Metrics',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),

                  // Metrics Grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.3,
                    children: [
                      MetricCard(
                        title: AppStrings.activeShipments,
                        value: '${stats.activeShipmentsCount}',
                        icon: Icons.local_shipping,
                        color: AppColors.statusInTransit,
                      ),
                      MetricCard(
                        title: AppStrings.deliveredToday,
                        value: '${stats.deliveredTodayCount}',
                        icon: Icons.task_alt,
                        color: AppColors.statusDelivered,
                      ),
                      MetricCard(
                        title: AppStrings.pendingItems,
                        value: '${stats.pendingWarehousingCount}',
                        icon: Icons.hourglass_top,
                        color: AppColors.statusPending,
                      ),
                      MetricCard(
                        title: AppStrings.lowStockAlerts,
                        value: '${stats.lowStockAlertsCount}',
                        icon: Icons.warning_amber_rounded,
                        color: AppColors.warning,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  const QuickActionsWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
