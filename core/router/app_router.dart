import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';
import '../../shared/widgets/main_scaffold.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/shipments/presentation/screens/shipment_list_screen.dart';
import '../../features/shipments/presentation/screens/shipment_detail_screen.dart';
import '../../features/shipments/presentation/screens/add_shipment_screen.dart';
import '../../features/inventory/presentation/screens/inventory_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.dashboard,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.dashboard,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: Routes.shipments,
          builder: (context, state) => const ShipmentListScreen(),
          routes: [
            GoRoute(
              path: 'add',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const AddShipmentScreen(),
            ),
            GoRoute(
              path: ':id',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) {
                final shipmentId = state.pathParameters['id'] ?? '';
                return ShipmentDetailScreen(shipmentId: shipmentId);
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.inventory,
          builder: (context, state) => const InventoryScreen(),
        ),
      ],
    ),
  ],
);
