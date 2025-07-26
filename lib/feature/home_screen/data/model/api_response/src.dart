import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'src.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Src extends HiveObject {
  @HiveField(0)
  final String? original;

  @HiveField(1)
  @JsonKey(name: 'large2x')
  final String? large2x;

  @HiveField(2)
  final String? large;

  @HiveField(3)
  final String? medium;

  @HiveField(4)
  final String? small;

  @HiveField(5)
  final String? portrait;

  @HiveField(6)
  final String? landscape;

  @HiveField(7)
  final String? tiny;

   Src({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);

  Map<String, dynamic> toJson() => _$SrcToJson(this);
}
