import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/routes.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../providers/shipment_provider.dart';
import '../widgets/shipment_card.dart';

class ShipmentListScreen extends ConsumerWidget {
  const ShipmentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipmentsState = ref.watch(shipmentsProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.shipmentsTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(shipmentsProvider.notifier).refresh(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Routes.addShipment),
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.createShipment),
      ),
      body: shipmentsState.when(
        loading: () => const LoadingIndicator(message: 'Loading shipments...'),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $err'),
              ElevatedButton(
                onPressed: () => ref.read(shipmentsProvider.notifier).refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (shipments) {
          if (shipments.isEmpty) {
            return EmptyState(
              title: 'No Active Shipments',
              message: 'Get started by creating your first offline-synced shipment.',
              action: ElevatedButton.icon(
                onPressed: () => context.push(Routes.addShipment),
                icon: const Icon(Icons.add),
                label: const Text(AppStrings.createShipment),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(shipmentsProvider.notifier).refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: shipments.length,
              itemBuilder: (context, index) {
                final shipment = shipments[index];
                return ShipmentCard(
                  shipment: shipment,
                  onTap: () => context.push(Routes.shipmentDetailsPath(shipment.id)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
