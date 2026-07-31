import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../domain/entities/shipment.dart';
import '../providers/shipment_provider.dart';
import '../widgets/status_badge.dart';

class ShipmentDetailScreen extends ConsumerWidget {
  final String shipmentId;

  const ShipmentDetailScreen({
    super.key,
    required this.shipmentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipmentsState = ref.watch(shipmentsProvider);
    final dateFormat = DateFormat('EEEE, MMM dd, yyyy - hh:mm a');

    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.shipmentDetailsTitle,
      ),
      body: shipmentsState.when(
        loading: () => const LoadingIndicator(),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (shipments) {
          final shipment = shipments.firstWhere(
            (s) => s.id == shipmentId,
            orElse: () => Shipment(
              id: shipmentId,
              trackingNumber: 'TRK-UNKNOWN',
              sender: 'N/A',
              recipient: 'N/A',
              origin: 'N/A',
              destination: 'N/A',
              status: ShipmentStatus.pending,
              createdAt: DateTime.now(),
              estimatedDelivery: DateTime.now(),
            ),
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              shipment.trackingNumber,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                            ),
                            StatusBadge(status: shipment.status),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        _buildDetailRow(context, 'Sender', shipment.sender, Icons.person_outline),
                        _buildDetailRow(context, 'Recipient', shipment.recipient, Icons.person),
                        _buildDetailRow(context, 'Origin Warehouse', shipment.origin, Icons.location_on_outlined),
                        _buildDetailRow(context, 'Destination', shipment.destination, Icons.flag_outlined),
                        _buildDetailRow(
                          context,
                          'Created At',
                          dateFormat.format(shipment.createdAt),
                          Icons.calendar_today,
                        ),
                        _buildDetailRow(
                          context,
                          'Estimated Delivery',
                          dateFormat.format(shipment.estimatedDelivery),
                          Icons.local_shipping_outlined,
                        ),
                        if (shipment.notes != null && shipment.notes!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          _buildDetailRow(context, 'Special Instructions', shipment.notes!, Icons.note_outlined),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Update Status',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ShipmentStatus.values.map((status) {
                    final isSelected = shipment.status == status;
                    return ChoiceChip(
                      label: Text(status.name),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          ref
                              .read(shipmentsProvider.notifier)
                              .updateStatus(shipment.id, status);
                        }
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondaryLight),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondaryLight,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
