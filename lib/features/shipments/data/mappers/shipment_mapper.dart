import '../../domain/entities/shipment.dart';
import '../datasources/db/schemas/shipment_schema.dart';

extension ShipmentSchemaX on ShipmentSchema {
  Shipment toDomain() {
    return Shipment(
      id: uuid,
      trackingNumber: trackingNumber,
      sender: sender,
      recipient: recipient,
      origin: origin,
      destination: destination,
      status: _parseStatus(status),
      createdAt: createdAt,
      estimatedDelivery: estimatedDelivery,
      notes: notes,
    );
  }

  static ShipmentStatus _parseStatus(String statusStr) {
    return ShipmentStatus.values.firstWhere(
      (e) => e.name == statusStr,
      orElse: () => ShipmentStatus.pending,
    );
  }
}

extension ShipmentDomainX on Shipment {
  ShipmentSchema toSchema() {
    final schema = ShipmentSchema()
      ..uuid = id
      ..trackingNumber = trackingNumber
      ..sender = sender
      ..recipient = recipient
      ..origin = origin
      ..destination = destination
      ..status = status.name
      ..createdAt = createdAt
      ..estimatedDelivery = estimatedDelivery
      ..notes = notes;
    return schema;
  }
}
