import 'package:isar/isar.dart';

part 'shipment_schema.g.dart';

@collection
class ShipmentSchema {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String uuid;

  late String trackingNumber;
  late String sender;
  late String recipient;
  late String origin;
  late String destination;
  
  @Enumerated(EnumType.name)
  late String status; // pending, inTransit, delivered, delayed, cancelled

  late DateTime createdAt;
  late DateTime estimatedDelivery;
  String? notes;
}
