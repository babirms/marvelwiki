import 'package:json_annotation/json_annotation.dart';
import 'package:marvelwiki/features/characters/data/entities/character_data_container_entity.dart';

part 'character_data_wrapper_entity.g.dart';

@JsonSerializable()
class CharacterDataWrapperEntity {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHTML;
  final CharacterDataContainerEntity? data;
  final String? etag;

  CharacterDataWrapperEntity({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.data,
    this.etag,
  });

  factory CharacterDataWrapperEntity.fromJson(json) =>
      _$CharacterDataWrapperEntityFromJson(json);

  toJson() => _$CharacterDataWrapperEntityToJson(this);
}
