import 'package:hive/hive.dart';
import 'src.dart';

part 'photos.g.dart';

@HiveType(typeId: 2)
class Photos extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? width;

  @HiveField(2)
  int? height;

  @HiveField(3)
  String? url;

  @HiveField(4)
  String? photographer;

  @HiveField(5)
  String? photographerUrl;

  @HiveField(6)
  int? photographerId;

  @HiveField(7)
  String? avgColor;

  @HiveField(8)
  Src? src;

  @HiveField(9)
  bool? liked;

  @HiveField(10)
  String? alt;

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

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
    id: json['id'],
    width: json['width'],
    height: json['height'],
    url: json['url'],
    photographer: json['photographer'],
    photographerUrl: json['photographer_url'],
    photographerId: json['photographer_id'],
    avgColor: json['avg_color'],
    src: json['src'] != null ? Src.fromJson(json['src']) : null,
    liked: json['liked'],
    alt: json['alt'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'width': width,
    'height': height,
    'url': url,
    'photographer': photographer,
    'photographer_url': photographerUrl,
    'photographer_id': photographerId,
    'avg_color': avgColor,
    'src': src?.toJson(),
    'liked': liked,
    'alt': alt,
  };
}
