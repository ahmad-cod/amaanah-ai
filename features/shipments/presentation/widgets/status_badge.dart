import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/extensions/string_extension.dart';
import '../../domain/entities/shipment.dart';

class StatusBadge extends StatelessWidget {
  final ShipmentStatus status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  Color _getColor() {
    return switch (status) {
      ShipmentStatus.pending => AppColors.statusPending,
      ShipmentStatus.inTransit => AppColors.statusInTransit,
      ShipmentStatus.delivered => AppColors.statusDelivered,
      ShipmentStatus.delayed => AppColors.statusDelayed,
      ShipmentStatus.cancelled => AppColors.statusCancelled,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            status.name.capitalize(),
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
