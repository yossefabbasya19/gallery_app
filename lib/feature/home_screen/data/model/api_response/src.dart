import 'package:hive/hive.dart';

part 'src.g.dart';

@HiveType(typeId: 1)
class Src extends HiveObject {
  @HiveField(0)
  String? original;

  @HiveField(1)
  String? large2x;

  @HiveField(2)
  String? large;

  @HiveField(3)
  String? medium;

  @HiveField(4)
  String? small;

  @HiveField(5)
  String? portrait;

  @HiveField(6)
  String? landscape;

  @HiveField(7)
  String? tiny;

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

  factory Src.fromJson(Map<String, dynamic> json) => Src(
    original: json['original'],
    large2x: json['large2x'],
    large: json['large'],
    medium: json['medium'],
    small: json['small'],
    portrait: json['portrait'],
    landscape: json['landscape'],
    tiny: json['tiny'],
  );

  Map<String, dynamic> toJson() => {
    'original': original,
    'large2x': large2x,
    'large': large,
    'medium': medium,
    'small': small,
    'portrait': portrait,
    'landscape': landscape,
    'tiny': tiny,
  };
}
