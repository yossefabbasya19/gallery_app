import 'package:hive/hive.dart';
import 'photos.dart';

part 'photo_response.g.dart';

@HiveType(typeId: 3)
class PhotoResponse extends HiveObject {
  @HiveField(0)
  int? page;

  @HiveField(1)
  int? perPage;

  @HiveField(2)
  List<Photos>? photos;

  @HiveField(3)
  int? totalResults;

  @HiveField(4)
  String? nextPage;

  @HiveField(5)
  String? prevPage;

  PhotoResponse({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) => PhotoResponse(
    page: json['page'],
    perPage: json['per_page'],
    photos: (json['photos'] as List?)
        ?.map((v) => Photos.fromJson(v))
        .toList(),
    totalResults: json['total_results'],
    nextPage: json['next_page'],
    prevPage: json['prev_page'],
  );

  Map<String, dynamic> toJson() => {
    'page': page,
    'per_page': perPage,
    'photos': photos?.map((e) => e.toJson()).toList(),
    'total_results': totalResults,
    'next_page': nextPage,
    'prev_page': prevPage,
  };
}
