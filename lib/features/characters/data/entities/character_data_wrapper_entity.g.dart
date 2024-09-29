// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_data_wrapper_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDataWrapperEntity _$CharacterDataWrapperEntityFromJson(
        Map<String, dynamic> json) =>
    CharacterDataWrapperEntity(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      attributionText: json['attributionText'] as String?,
      attributionHTML: json['attributionHTML'] as String?,
      data: json['data'] == null
          ? null
          : CharacterDataContainerEntity.fromJson(json['data']),
      etag: json['etag'] as String?,
    );

Map<String, dynamic> _$CharacterDataWrapperEntityToJson(
        CharacterDataWrapperEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'copyright': instance.copyright,
      'attributionText': instance.attributionText,
      'attributionHTML': instance.attributionHTML,
      'data': instance.data,
      'etag': instance.etag,
    };
