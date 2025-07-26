import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'src.dart';

part 'photos.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(explicitToJson: true)
class Photos extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? width;

  @HiveField(2)
  final int? height;

  @HiveField(3)
  final String? url;

  @HiveField(4)
  final String? photographer;

  @HiveField(5)
  @JsonKey(name: 'photographer_url')
  final String? photographerUrl;

  @HiveField(6)
  @JsonKey(name: 'photographer_id')
  final int? photographerId;

  @HiveField(7)
  @JsonKey(name: 'avg_color')
  final String? avgColor;

  @HiveField(8)
  final Src? src;

  @HiveField(9)
  final bool? liked;

  @HiveField(10)
  final String? alt;

   Photos({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);
}
