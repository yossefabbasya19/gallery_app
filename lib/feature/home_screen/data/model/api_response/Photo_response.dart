import 'Photos.dart';

class PhotoResponse {
  PhotoResponse({
      this.page, 
      this.perPage, 
      this.photos, 
      this.totalResults, 
      this.nextPage, 
      this.prevPage,});

  PhotoResponse.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['per_page'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
  }
  int? page;
  int? perPage;
  List<Photos>? photos;
  int? totalResults;
  String? nextPage;
  String? prevPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    map['total_results'] = totalResults;
    map['next_page'] = nextPage;
    map['prev_page'] = prevPage;
    return map;
  }

}