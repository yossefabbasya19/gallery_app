import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gallery_app/core/api_service/api_constance.dart';
import 'package:gallery_app/core/api_service/api_service.dart';
import 'package:gallery_app/core/failure/failure.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/Photo_response.dart';
import 'package:gallery_app/feature/home_screen/data/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImple extends HomeRepo {
  @factoryMethod
  HomeRepoImple();

  @override
  Future<Either<Failure, PhotoResponse>> getPhoto(int pageNumber) async {
    try {
      var response = await ApiService.get(
        ApiConstance.photosEndPoint,
        data: {"page": pageNumber, "per_page": 20},
      );
      PhotoResponse photoResponse = PhotoResponse.fromJson(response);
      return Right(photoResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(
        ServerFailure(errorMessage: "unknown error , try access later"),
      );
    }
  }
}
