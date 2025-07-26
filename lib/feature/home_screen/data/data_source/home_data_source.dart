import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/failure/failure.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/photo_response.dart';

abstract class HomeDataSource {
  Future<Either<Failure,PhotoResponse>>getPhoto(int pageNumber);

}