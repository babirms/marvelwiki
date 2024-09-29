import 'package:json_annotation/json_annotation.dart';

part 'url_entity.g.dart';

@JsonSerializable()
class UrlEntity {
  final String? type;
  final String? url;

  UrlEntity({this.type, this.url});

  factory UrlEntity.fromJson(json) => _$UrlEntityFromJson(json);

  toJson() => _$UrlEntityToJson(this);
}
