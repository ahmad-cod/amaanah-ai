import 'package:flutter/material.dart';
import 'package:amaanah/core/constants/app_colors.dart';
import 'package:amaanah/features/shipments/domain/entities/shipment.dart';

class AnalysisResultData {
  final String trackingNumber;
  final String sender;
  final String recipient;
  final String origin;
  final String destination;
  final String packageType;
  final String estimatedWeight;
  final String aiLogisticsInsight;
  final double confidenceScore;

  const AnalysisResultData({
    required this.trackingNumber,
    required this.sender,
    required this.recipient,
    required this.origin,
    required this.destination,
    required this.packageType,
    required this.estimatedWeight,
    required this.aiLogisticsInsight,
    required this.confidenceScore,
  });
}

class AnalysisResultCard extends StatelessWidget {
  final AnalysisResultData result;
  final VoidCallback onSaveShipment;

  const AnalysisResultCard({
    super.key,
    required this.result,
    required this.onSaveShipment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.primaryLight, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI Analysis Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.auto_awesome,
                          color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Analysis Extracted',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                        ),
                        Text(
                          'On-Device Gemma Model • ${(result.confidenceScore * 100).toStringAsFixed(0)}% Confidence',
                          style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textSecondaryLight),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    result.trackingNumber,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.success,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            // Extracted Info Grid
            Row(
              children: [
                Expanded(
                    child: _buildInfoCell(context, 'Origin', result.origin,
                        Icons.location_on_outlined)),
                Expanded(
                    child: _buildInfoCell(context, 'Destination',
                        result.destination, Icons.flag_outlined)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: _buildInfoCell(context, 'Sender', result.sender,
                        Icons.person_outline)),
                Expanded(
                    child: _buildInfoCell(
                        context, 'Recipient', result.recipient, Icons.person)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: _buildInfoCell(context, 'Package Type',
                        result.packageType, Icons.inventory_2_outlined)),
                Expanded(
                    child: _buildInfoCell(context, 'Weight Est.',
                        result.estimatedWeight, Icons.scale_outlined)),
              ],
            ),

            const SizedBox(height: 16),
            // AI Recommendation Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.lightbulb_outline,
                      color: AppColors.accent, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      result.aiLogisticsInsight,
                      style: const TextStyle(fontSize: 12, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onSaveShipment,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Confirm & Save Shipment'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                backgroundColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCell(
      BuildContext context, String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondaryLight),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                    fontSize: 11, color: AppColors.textSecondaryLight),
              ),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
