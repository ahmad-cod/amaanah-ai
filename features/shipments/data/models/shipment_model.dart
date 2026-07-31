import '../../domain/entities/shipment.dart';

class ShipmentModel {
  final String id;
  final String trackingNumber;
  final String sender;
  final String recipient;
  final String origin;
  final String destination;
  final String status;
  final String createdAt;
  final String estimatedDelivery;
  final String? notes;

  const ShipmentModel({
    required this.id,
    required this.trackingNumber,
    required this.sender,
    required this.recipient,
    required this.origin,
    required this.destination,
    required this.status,
    required this.createdAt,
    required this.estimatedDelivery,
    this.notes,
  });

  factory ShipmentModel.fromJson(Map<String, dynamic> json) {
    return ShipmentModel(
      id: json['id'] as String,
      trackingNumber: json['trackingNumber'] as String,
      sender: json['sender'] as String,
      recipient: json['recipient'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      estimatedDelivery: json['estimatedDelivery'] as String,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trackingNumber': trackingNumber,
      'sender': sender,
      'recipient': recipient,
      'origin': origin,
      'destination': destination,
      'status': status,
      'createdAt': createdAt,
      'estimatedDelivery': estimatedDelivery,
      'notes': notes,
    };
  }

  Shipment toEntity() {
    return Shipment(
      id: id,
      trackingNumber: trackingNumber,
      sender: sender,
      recipient: recipient,
      origin: origin,
      destination: destination,
      status: ShipmentStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => ShipmentStatus.pending,
      ),
      createdAt: DateTime.parse(createdAt),
      estimatedDelivery: DateTime.parse(estimatedDelivery),
      notes: notes,
    );
  }
}
