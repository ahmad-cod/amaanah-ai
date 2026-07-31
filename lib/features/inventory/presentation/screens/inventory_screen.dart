import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../providers/inventory_provider.dart';
import '../widgets/inventory_item_tile.dart';

class InventoryScreen extends ConsumerWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryState = ref.watch(inventoryProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.inventoryTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(inventoryProvider.notifier).refresh(),
          ),
        ],
      ),
      body: inventoryState.when(
        loading: () => const LoadingIndicator(message: 'Loading warehouse inventory...'),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (items) {
          if (items.isEmpty) {
            return const EmptyState(
              title: 'No Inventory Items',
              message: 'Your offline warehouse storage is currently empty.',
              icon: Icons.inventory_2_outlined,
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(inventoryProvider.notifier).refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InventoryItemTile(
                  item: item,
                  onIncrement: () {
                    ref.read(inventoryProvider.notifier).updateStock(item.id, 1);
                  },
                  onDecrement: () {
                    ref.read(inventoryProvider.notifier).updateStock(item.id, -1);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
