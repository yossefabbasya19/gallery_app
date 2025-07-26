import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'photos.dart';

part 'photo_response.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(explicitToJson: true)
class PhotoResponse extends HiveObject {
  @HiveField(0)
  final int? page;

  @HiveField(1)
  @JsonKey(name: 'per_page')
  final int? perPage;

  @HiveField(2)
  final List<Photos>? photos;

  @HiveField(3)
  @JsonKey(name: 'total_results')
  final int? totalResults;

  @HiveField(4)
  @JsonKey(name: 'next_page')
  final String? nextPage;

  @HiveField(5)
  @JsonKey(name: 'prev_page')
  final String? prevPage;

   PhotoResponse({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoResponseToJson(this);
}
