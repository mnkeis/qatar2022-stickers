// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_album.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarAlbumCollection on Isar {
  IsarCollection<IsarAlbum> get isarAlbums => this.collection();
}

const IsarAlbumSchema = CollectionSchema(
  name: r'IsarAlbum',
  id: 8073605566212355973,
  properties: {
    r'teams': PropertySchema(
      id: 0,
      name: r'teams',
      type: IsarType.objectList,
      target: r'IsarTeam',
    )
  },
  estimateSize: _isarAlbumEstimateSize,
  serialize: _isarAlbumSerialize,
  deserialize: _isarAlbumDeserialize,
  deserializeProp: _isarAlbumDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'IsarTeam': IsarTeamSchema,
    r'IsarSticker': IsarStickerSchema
  },
  getId: _isarAlbumGetId,
  getLinks: _isarAlbumGetLinks,
  attach: _isarAlbumAttach,
  version: '3.0.2',
);

int _isarAlbumEstimateSize(
  IsarAlbum object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.teams;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarTeam]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += IsarTeamSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _isarAlbumSerialize(
  IsarAlbum object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<IsarTeam>(
    offsets[0],
    allOffsets,
    IsarTeamSchema.serialize,
    object.teams,
  );
}

IsarAlbum _isarAlbumDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarAlbum(
    id: id,
    teams: reader.readObjectList<IsarTeam>(
      offsets[0],
      IsarTeamSchema.deserialize,
      allOffsets,
      IsarTeam(),
    ),
  );
  return object;
}

P _isarAlbumDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<IsarTeam>(
        offset,
        IsarTeamSchema.deserialize,
        allOffsets,
        IsarTeam(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarAlbumGetId(IsarAlbum object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarAlbumGetLinks(IsarAlbum object) {
  return [];
}

void _isarAlbumAttach(IsarCollection<dynamic> col, Id id, IsarAlbum object) {
  object.id = id;
}

extension IsarAlbumQueryWhereSort
    on QueryBuilder<IsarAlbum, IsarAlbum, QWhere> {
  QueryBuilder<IsarAlbum, IsarAlbum, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarAlbumQueryWhere
    on QueryBuilder<IsarAlbum, IsarAlbum, QWhereClause> {
  QueryBuilder<IsarAlbum, IsarAlbum, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterWhereClause> idBetween(
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

extension IsarAlbumQueryFilter
    on QueryBuilder<IsarAlbum, IsarAlbum, QFilterCondition> {
  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> teamsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teams',
      ));
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> teamsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teams',
      ));
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> teamsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'teams',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> teamsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'teams',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> teamsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'teams',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> teamsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'teams',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition>
      teamsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'teams',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> teamsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'teams',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarAlbumQueryObject
    on QueryBuilder<IsarAlbum, IsarAlbum, QFilterCondition> {
  QueryBuilder<IsarAlbum, IsarAlbum, QAfterFilterCondition> teamsElement(
      FilterQuery<IsarTeam> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'teams');
    });
  }
}

extension IsarAlbumQueryLinks
    on QueryBuilder<IsarAlbum, IsarAlbum, QFilterCondition> {}

extension IsarAlbumQuerySortBy on QueryBuilder<IsarAlbum, IsarAlbum, QSortBy> {}

extension IsarAlbumQuerySortThenBy
    on QueryBuilder<IsarAlbum, IsarAlbum, QSortThenBy> {
  QueryBuilder<IsarAlbum, IsarAlbum, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarAlbum, IsarAlbum, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarAlbumQueryWhereDistinct
    on QueryBuilder<IsarAlbum, IsarAlbum, QDistinct> {}

extension IsarAlbumQueryProperty
    on QueryBuilder<IsarAlbum, IsarAlbum, QQueryProperty> {
  QueryBuilder<IsarAlbum, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarAlbum, List<IsarTeam>?, QQueryOperations> teamsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teams');
    });
  }
}
