// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// Coverage-ignore-start
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const InventorySchemaSchema = CollectionSchema<InventorySchema>(
  name: r'InventorySchema',
  id: 7482910294817263,
  properties: {
    r'uuid': PropertySchema(
      id: 0,
      name: r'uuid',
      type: IsarType.string,
    ),
    r'sku': PropertySchema(
      id: 1,
      name: r'sku',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 3,
      name: r'category',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 4,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'reorderLevel': PropertySchema(
      id: 5,
      name: r'reorderLevel',
      type: IsarType.long,
    ),
    r'warehouseZone': PropertySchema(
      id: 6,
      name: r'warehouseZone',
      type: IsarType.string,
    ),
    r'lastUpdated': PropertySchema(
      id: 7,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _inventorySchemaEstimateSize,
  serialize: _inventorySchemaSerialize,
  deserialize: _inventorySchemaDeserialize,
  deserializeProp: _inventorySchemaDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'uuid': IndexSchema(
      id: 987654321,
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

int _inventorySchemaEstimateSize(
  InventorySchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  int bytesCount = 0;
  bytesCount += 3 + object.uuid.length * 3;
  bytesCount += 3 + object.sku.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.warehouseZone.length * 3;
  return bytesCount;
}

void _inventorySchemaSerialize(
  InventorySchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.uuid);
  writer.writeString(offsets[1], object.sku);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.category);
  writer.writeLong(offsets[4], object.quantity);
  writer.writeLong(offsets[5], object.reorderLevel);
  writer.writeString(offsets[6], object.warehouseZone);
  writer.writeDateTime(offsets[7], object.lastUpdated);
}

InventorySchema _inventorySchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InventorySchema();
  object.isarId = id;
  object.uuid = reader.readString(offsets[0]);
  object.sku = reader.readString(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.category = reader.readString(offsets[3]);
  object.quantity = reader.readLong(offsets[4]);
  object.reorderLevel = reader.readLong(offsets[5]);
  object.warehouseZone = reader.readString(offsets[6]);
  object.lastUpdated = reader.readDateTime(offsets[7]);
  return object;
}

P _inventorySchemaDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension InventorySchemaQueryFilter on QueryBuilder<InventorySchema, InventorySchema, QFilterCondition> {
  QueryBuilder<InventorySchema, InventorySchema, QAfterFilterCondition> uuidEqualTo(
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
}

extension GetInventorySchemaCollection on Isar {
  IsarCollection<InventorySchema> get inventorySchemas => this.collection();
}
