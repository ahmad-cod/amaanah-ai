// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it.');

Shipment _$ShipmentFromJson(Map<String, dynamic> json) {
  return _Shipment.fromJson(json);
}

mixin _$Shipment {
  String get id => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  String get item => throw _privateConstructorUsedError;
  String get deadline => throw _privateConstructorUsedError;
  String get verificationCode => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShipmentCopyWith<Shipment> get copyWith =>
      throw _privateConstructorUsedError;
}

abstract class $ShipmentCopyWith<$Res> {
  factory $ShipmentCopyWith(Shipment value, $Res Function(Shipment) then) =
      _$ShipmentCopyWithImpl<$Res, Shipment>;
  @useResult
  $Res call({
    String id,
    String recipient,
    String destination,
    String item,
    String deadline,
    String verificationCode,
    String? notes,
  });
}

class _$ShipmentCopyWithImpl<$Res, $Val extends Shipment>
    implements $ShipmentCopyWith<$Res> {
  _$ShipmentCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipient = null,
    Object? destination = null,
    Object? item = null,
    Object? deadline = null,
    Object? verificationCode = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

abstract class _$$ShipmentImplCopyWith<$Res>
    implements $ShipmentCopyWith<$Res> {
  factory _$$ShipmentImplCopyWith(
          _$ShipmentImpl value, $Res Function(_$ShipmentImpl) then) =
      __$$ShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String recipient,
    String destination,
    String item,
    String deadline,
    String verificationCode,
    String? notes,
  });
}

class __$$ShipmentImplCopyWithImpl<$Res>
    extends _$ShipmentCopyWithImpl<$Res, _$ShipmentImpl>
    implements _$$ShipmentImplCopyWith<$Res> {
  __$$ShipmentImplCopyWithImpl(
      _$ShipmentImpl _value, $Res Function(_$ShipmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipient = null,
    Object? destination = null,
    Object? item = null,
    Object? deadline = null,
    Object? verificationCode = null,
    Object? notes = freezed,
  }) {
    return _then(_$ShipmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

class _$ShipmentImpl implements _Shipment {
  const _$ShipmentImpl({
    required this.id,
    required this.recipient,
    required this.destination,
    required this.item,
    required this.deadline,
    required this.verificationCode,
    this.notes,
  });

  factory _$ShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipmentImplFromJson(json);

  @override
  final String id;
  @override
  final String recipient;
  @override
  final String destination;
  @override
  final String item;
  @override
  final String deadline;
  @override
  final String verificationCode;
  @override
  final String? notes;

  @override
  String toString() {
    return 'Shipment(id: $id, recipient: $recipient, destination: $destination, item: $item, deadline: $deadline, verificationCode: $verificationCode, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, recipient, destination,
      item, deadline, verificationCode, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith =>
      __$$ShipmentImplCopyWithImpl<_$ShipmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipmentImplToJson(this);
  }
}

abstract class _Shipment implements Shipment {
  const factory _Shipment({
    required final String id,
    required final String recipient,
    required final String destination,
    required final String item,
    required final String deadline,
    required final String verificationCode,
    final String? notes,
  }) = _$ShipmentImpl;

  factory _Shipment.fromJson(Map<String, dynamic> json) =
      _$ShipmentImpl.fromJson;

  @override
  String get id;
  @override
  String get recipient;
  @override
  String get destination;
  @override
  String get item;
  @override
  String get deadline;
  @override
  String get verificationCode;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$ShipmentImplCopyWith<_$ShipmentImpl> get copyWith;
}
