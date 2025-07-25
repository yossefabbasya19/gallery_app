import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/failure/failure.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/Photo_response.dart';

abstract class HomeRepo {
Future<Either<Failure,PhotoResponse>>getPhoto(int pageNumber);
}