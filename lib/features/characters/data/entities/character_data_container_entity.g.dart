// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_data_container_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDataContainerEntity _$CharacterDataContainerEntityFromJson(
        Map<String, dynamic> json) =>
    CharacterDataContainerEntity(
      offset: (json['offset'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map(CharacterEntity.fromJson)
          .toList(),
    );

Map<String, dynamic> _$CharacterDataContainerEntityToJson(
        CharacterDataContainerEntity instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': instance.results,
    };
