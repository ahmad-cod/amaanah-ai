// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// Coverage-ignore-start
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ShipmentSchemaSchema = CollectionSchema<ShipmentSchema>(
  name: r'ShipmentSchema',
  id: 6183928172638102,
  properties: {
    r'uuid': PropertySchema(
      id: 0,
      name: r'uuid',
      type: IsarType.string,
    ),
    r'trackingNumber': PropertySchema(
      id: 1,
      name: r'trackingNumber',
      type: IsarType.string,
    ),
    r'sender': PropertySchema(
      id: 2,
      name: r'sender',
      type: IsarType.string,
    ),
    r'recipient': PropertySchema(
      id: 3,
      name: r'recipient',
      type: IsarType.string,
    ),
    r'origin': PropertySchema(
      id: 4,
      name: r'origin',
      type: IsarType.string,
    ),
    r'destination': PropertySchema(
      id: 5,
      name: r'destination',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 7,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'estimatedDelivery': PropertySchema(
      id: 8,
      name: r'estimatedDelivery',
      type: IsarType.dateTime,
    ),
    r'notes': PropertySchema(
      id: 9,
      name: r'notes',
      type: IsarType.string,
    ),
  },
  estimateSize: _shipmentSchemaEstimateSize,
  serialize: _shipmentSchemaSerialize,
  deserialize: _shipmentSchemaDeserialize,
  deserializeProp: _shipmentSchemaDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'uuid': IndexSchema(
      id: 1029384756,
      name: r'uuid',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
);

int _shipmentSchemaEstimateSize(
  ShipmentSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  int bytesCount = 0;
  bytesCount += 3 + object.uuid.length * 3;
  bytesCount += 3 + object.trackingNumber.length * 3;
  bytesCount += 3 + object.sender.length * 3;
  bytesCount += 3 + object.recipient.length * 3;
  bytesCount += 3 + object.origin.length * 3;
  bytesCount += 3 + object.destination.length * 3;
  bytesCount += 3 + object.status.length * 3;
  final notes = object.notes;
  if (notes != null) {
    bytesCount += 3 + notes.length * 3;
  }
  return bytesCount;
}

void _shipmentSchemaSerialize(
  ShipmentSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.uuid);
  writer.writeString(offsets[1], object.trackingNumber);
  writer.writeString(offsets[2], object.sender);
  writer.writeString(offsets[3], object.recipient);
  writer.writeString(offsets[4], object.origin);
  writer.writeString(offsets[5], object.destination);
  writer.writeString(offsets[6], object.status);
  writer.writeDateTime(offsets[7], object.createdAt);
  writer.writeDateTime(offsets[8], object.estimatedDelivery);
  writer.writeString(offsets[9], object.notes);
}

ShipmentSchema _shipmentSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShipmentSchema();
  object.isarId = id;
  object.uuid = reader.readString(offsets[0]);
  object.trackingNumber = reader.readString(offsets[1]);
  object.sender = reader.readString(offsets[2]);
  object.recipient = reader.readString(offsets[3]);
  object.origin = reader.readString(offsets[4]);
  object.destination = reader.readString(offsets[5]);
  object.status = reader.readString(offsets[6]);
  object.createdAt = reader.readDateTime(offsets[7]);
  object.estimatedDelivery = reader.readDateTime(offsets[8]);
  object.notes = reader.readStringOrNull(offsets[9]);
  return object;
}

P _shipmentSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ShipmentSchemaQueryFilter on QueryBuilder<ShipmentSchema, ShipmentSchema, QFilterCondition> {
  QueryBuilder<ShipmentSchema, ShipmentSchema, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentSchema, ShipmentSchema, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension ShipmentSchemaQueryWhereSort on QueryBuilder<ShipmentSchema, ShipmentSchema, QWhere> {
  QueryBuilder<ShipmentSchema, ShipmentSchema, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShipmentSchemaQueryWhere on QueryBuilder<ShipmentSchema, ShipmentSchema, QWhereClause> {
  QueryBuilder<ShipmentSchema, ShipmentSchema, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }
}

extension ShipmentSchemaQueryProperty on QueryBuilder<ShipmentSchema, ShipmentSchema, QQueryProperty> {
  QueryBuilder<ShipmentSchema, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

extension GetShipmentSchemaCollection on Isar {
  IsarCollection<ShipmentSchema> get shipmentSchemas => this.collection();
}
