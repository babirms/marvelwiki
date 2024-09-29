import 'package:json_annotation/json_annotation.dart';

part 'character_entity.g.dart';

@JsonSerializable()
class CharacterEntity {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? modified;
  final String? resourceURI;

  CharacterEntity({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceURI,
  });

  factory CharacterEntity.fromJson(json) => _$CharacterEntityFromJson(json);

  toJson() => _$CharacterEntityToJson(this);
}
