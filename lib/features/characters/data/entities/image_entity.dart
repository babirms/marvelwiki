import 'package:json_annotation/json_annotation.dart';

part 'image_entity.g.dart';

@JsonSerializable()
class ImageEntity {
  final String? path;
  final String? extension;

  ImageEntity({
    this.path,
    this.extension,
  });

  factory ImageEntity.fromJson(json) => _$ImageEntityFromJson(json);

  toJson() => _$ImageEntityToJson(this);
}
