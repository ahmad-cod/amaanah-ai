// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShipmentImpl _$$ShipmentImplFromJson(Map<String, dynamic> json) =>
    _$ShipmentImpl(
      id: json['id'] as String,
      recipient: json['recipient'] as String,
      destination: json['destination'] as String,
      item: json['item'] as String,
      deadline: json['deadline'] as String,
      verificationCode: json['verificationCode'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ShipmentImplToJson(_$ShipmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipient': instance.recipient,
      'destination': instance.destination,
      'item': instance.item,
      'deadline': instance.deadline,
      'verificationCode': instance.verificationCode,
      'notes': instance.notes,
    };
