import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ImageAttachmentWidget extends StatelessWidget {
  final String? selectedSampleName;
  final Function(String name, IconData icon, Color color) onSelectImage;
  final VoidCallback onClearImage;

  const ImageAttachmentWidget({
    super.key,
    this.selectedSampleName,
    required this.onSelectImage,
    required this.onClearImage,
  });

  static const List<Map<String, dynamic>> samples = [
    {
      'name': 'Cargo Manifest #892',
      'icon': Icons.description_outlined,
      'color': AppColors.primary,
    },
    {
      'name': 'Waybill / Waybill Tag',
      'icon': Icons.qr_code_scanner,
      'color': AppColors.info,
    },
    {
      'name': 'Pallet & Container Photo',
      'icon': Icons.inventory_2_outlined,
      'color': AppColors.accent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.image_outlined, color: AppColors.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Cargo & Document Image Attachment',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        if (selectedSampleName != null) ...[
          // Active Image Preview Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary, width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.center_focus_strong_rounded,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedSampleName!,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Attached • Ready for Gemma OCR & visual model analysis',
                        style: TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: AppColors.error),
                  onPressed: onClearImage,
                ),
              ],
            ),
          ),
        ] else ...[
          // Selector options grid
          Row(
            children: samples.map((sample) {
              final name = sample['name'] as String;
              final icon = sample['icon'] as IconData;
              final color = sample['color'] as Color;

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      onTap: () => onSelectImage(name, icon, color),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
                        child: Column(
                          children: [
                            Icon(icon, color: color, size: 24),
                            const SizedBox(height: 6),
                            Text(
                              name,
                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}
