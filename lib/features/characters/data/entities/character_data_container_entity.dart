import 'package:json_annotation/json_annotation.dart';
import 'package:marvelwiki/features/characters/data/entities/character_entity.dart';

part 'character_data_container_entity.g.dart';

@JsonSerializable()
class CharacterDataContainerEntity {
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<CharacterEntity>? results;

  CharacterDataContainerEntity({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory CharacterDataContainerEntity.fromJson(json) =>
      _$CharacterDataContainerEntityFromJson(json);

  toJson() => _$CharacterDataContainerEntityToJson(this);
}
