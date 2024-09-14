// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_emotion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEmotionIsarCollection on Isar {
  IsarCollection<EmotionIsar> get emotionIsars => this.collection();
}

const EmotionIsarSchema = CollectionSchema(
  name: r'EmotionIsar',
  id: -288752441633012488,
  properties: {
    r'emotionType': PropertySchema(
      id: 0,
      name: r'emotionType',
      type: IsarType.string,
    ),
    r'issueDate': PropertySchema(
      id: 1,
      name: r'issueDate',
      type: IsarType.dateTime,
    ),
    r'note': PropertySchema(
      id: 2,
      name: r'note',
      type: IsarType.string,
    ),
    r'selfEsteemLevel': PropertySchema(
      id: 3,
      name: r'selfEsteemLevel',
      type: IsarType.double,
    ),
    r'stressLevel': PropertySchema(
      id: 4,
      name: r'stressLevel',
      type: IsarType.double,
    ),
    r'subFeelings': PropertySchema(
      id: 5,
      name: r'subFeelings',
      type: IsarType.stringList,
    )
  },
  estimateSize: _emotionIsarEstimateSize,
  serialize: _emotionIsarSerialize,
  deserialize: _emotionIsarDeserialize,
  deserializeProp: _emotionIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _emotionIsarGetId,
  getLinks: _emotionIsarGetLinks,
  attach: _emotionIsarAttach,
  version: '3.1.0+1',
);

int _emotionIsarEstimateSize(
  EmotionIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.emotionType.length * 3;
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.subFeelings.length * 3;
  {
    for (var i = 0; i < object.subFeelings.length; i++) {
      final value = object.subFeelings[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _emotionIsarSerialize(
  EmotionIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.emotionType);
  writer.writeDateTime(offsets[1], object.issueDate);
  writer.writeString(offsets[2], object.note);
  writer.writeDouble(offsets[3], object.selfEsteemLevel);
  writer.writeDouble(offsets[4], object.stressLevel);
  writer.writeStringList(offsets[5], object.subFeelings);
}

EmotionIsar _emotionIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmotionIsar();
  object.emotionType = reader.readString(offsets[0]);
  object.id = id;
  object.issueDate = reader.readDateTime(offsets[1]);
  object.note = reader.readStringOrNull(offsets[2]);
  object.selfEsteemLevel = reader.readDouble(offsets[3]);
  object.stressLevel = reader.readDouble(offsets[4]);
  object.subFeelings = reader.readStringList(offsets[5]) ?? [];
  return object;
}

P _emotionIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _emotionIsarGetId(EmotionIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _emotionIsarGetLinks(EmotionIsar object) {
  return [];
}

void _emotionIsarAttach(
    IsarCollection<dynamic> col, Id id, EmotionIsar object) {
  object.id = id;
}

extension EmotionIsarQueryWhereSort
    on QueryBuilder<EmotionIsar, EmotionIsar, QWhere> {
  QueryBuilder<EmotionIsar, EmotionIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EmotionIsarQueryWhere
    on QueryBuilder<EmotionIsar, EmotionIsar, QWhereClause> {
  QueryBuilder<EmotionIsar, EmotionIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EmotionIsarQueryFilter
    on QueryBuilder<EmotionIsar, EmotionIsar, QFilterCondition> {
  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emotionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emotionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emotionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emotionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emotionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emotionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emotionType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotionType',
        value: '',
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      emotionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emotionType',
        value: '',
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      issueDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      issueDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      issueDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      issueDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'note',
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      selfEsteemLevelEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selfEsteemLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      selfEsteemLevelGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selfEsteemLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      selfEsteemLevelLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selfEsteemLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      selfEsteemLevelBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selfEsteemLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      stressLevelEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stressLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      stressLevelGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stressLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      stressLevelLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stressLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      stressLevelBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stressLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subFeelings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subFeelings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subFeelings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subFeelings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subFeelings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subFeelings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subFeelings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subFeelings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subFeelings',
        value: '',
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subFeelings',
        value: '',
      ));
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subFeelings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subFeelings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subFeelings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subFeelings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subFeelings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterFilterCondition>
      subFeelingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subFeelings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension EmotionIsarQueryObject
    on QueryBuilder<EmotionIsar, EmotionIsar, QFilterCondition> {}

extension EmotionIsarQueryLinks
    on QueryBuilder<EmotionIsar, EmotionIsar, QFilterCondition> {}

extension EmotionIsarQuerySortBy
    on QueryBuilder<EmotionIsar, EmotionIsar, QSortBy> {
  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortByEmotionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionType', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortByEmotionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionType', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortByIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueDate', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortByIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueDate', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortBySelfEsteemLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selfEsteemLevel', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy>
      sortBySelfEsteemLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selfEsteemLevel', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortByStressLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stressLevel', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> sortByStressLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stressLevel', Sort.desc);
    });
  }
}

extension EmotionIsarQuerySortThenBy
    on QueryBuilder<EmotionIsar, EmotionIsar, QSortThenBy> {
  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByEmotionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionType', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByEmotionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionType', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueDate', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueDate', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenBySelfEsteemLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selfEsteemLevel', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy>
      thenBySelfEsteemLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selfEsteemLevel', Sort.desc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByStressLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stressLevel', Sort.asc);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QAfterSortBy> thenByStressLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stressLevel', Sort.desc);
    });
  }
}

extension EmotionIsarQueryWhereDistinct
    on QueryBuilder<EmotionIsar, EmotionIsar, QDistinct> {
  QueryBuilder<EmotionIsar, EmotionIsar, QDistinct> distinctByEmotionType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emotionType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QDistinct> distinctByIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issueDate');
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QDistinct>
      distinctBySelfEsteemLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selfEsteemLevel');
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QDistinct> distinctByStressLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stressLevel');
    });
  }

  QueryBuilder<EmotionIsar, EmotionIsar, QDistinct> distinctBySubFeelings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subFeelings');
    });
  }
}

extension EmotionIsarQueryProperty
    on QueryBuilder<EmotionIsar, EmotionIsar, QQueryProperty> {
  QueryBuilder<EmotionIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EmotionIsar, String, QQueryOperations> emotionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emotionType');
    });
  }

  QueryBuilder<EmotionIsar, DateTime, QQueryOperations> issueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issueDate');
    });
  }

  QueryBuilder<EmotionIsar, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<EmotionIsar, double, QQueryOperations>
      selfEsteemLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selfEsteemLevel');
    });
  }

  QueryBuilder<EmotionIsar, double, QQueryOperations> stressLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stressLevel');
    });
  }

  QueryBuilder<EmotionIsar, List<String>, QQueryOperations>
      subFeelingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subFeelings');
    });
  }
}
