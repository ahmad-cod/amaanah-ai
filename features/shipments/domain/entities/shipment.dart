enum ShipmentStatus {
  pending,
  inTransit,
  delivered,
  delayed,
  cancelled,
}

class Shipment {
  final String id;
  final String trackingNumber;
  final String sender;
  final String recipient;
  final String origin;
  final String destination;
  final ShipmentStatus status;
  final DateTime createdAt;
  final DateTime estimatedDelivery;
  final String? notes;

  const Shipment({
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

  Shipment copyWith({
    String? id,
    String? trackingNumber,
    String? sender,
    String? recipient,
    String? origin,
    String? destination,
    ShipmentStatus? status,
    DateTime? createdAt,
    DateTime? estimatedDelivery,
    String? notes,
  }) {
    return Shipment(
      id: id ?? this.id,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      sender: sender ?? this.sender,
      recipient: recipient ?? this.recipient,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      estimatedDelivery: estimatedDelivery ?? this.estimatedDelivery,
      notes: notes ?? this.notes,
    );
  }
}
