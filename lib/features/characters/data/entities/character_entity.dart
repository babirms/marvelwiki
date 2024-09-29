import 'package:json_annotation/json_annotation.dart';
import 'package:marvelwiki/features/characters/data/entities/image_entity.dart';
import 'package:marvelwiki/features/characters/data/entities/url_entity.dart';

part 'character_entity.g.dart';

@JsonSerializable()
class CharacterEntity {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? modified;
  final String? resourceURI;
  final List<UrlEntity>? urls;
  final ImageEntity? thumbnail;

  CharacterEntity({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceURI,
    this.urls,
    this.thumbnail,
  });

  factory CharacterEntity.fromJson(json) => _$CharacterEntityFromJson(json);

  toJson() => _$CharacterEntityToJson(this);
}
