import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gallery_app/core/api_service/api_constance.dart';
import 'package:gallery_app/core/api_service/api_service.dart';
import 'package:gallery_app/core/check_connection/check_connection.dart';
import 'package:gallery_app/core/failure/failure.dart';
import 'package:gallery_app/core/hive/hive_function.dart';
import 'package:gallery_app/feature/home_screen/data/data_source/home_data_source.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/photo_response.dart';
import 'package:gallery_app/feature/home_screen/data/repo/home_repo.dart';
import 'package:gallery_app/main.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImple extends HomeRepo {
  @factoryMethod
  HomeRepoImple(this.homeDataSource);
  final HomeDataSource homeDataSource;


  @override
  Future<Either<Failure, PhotoResponse>> getPhoto(int pageNumber) async {
    return await homeDataSource.getPhoto(pageNumber);
  }
}
/*try {
      bool isConnected = await CheckConnection().checkNetwork();
      if (isConnected) {
        //var hiveBox = Hive.box<PhotoResponse>(hiveBoxName);
        //await hiveBox.clear();
       await HiveFunction().clearCache();
        var response = await ApiService.get(
          ApiConstance.photosEndPoint,
          data: {"page": pageNumber, "per_page": 40},
        );

        PhotoResponse photoResponse = PhotoResponse.fromJson(response);
        // await hiveBox.add(photoResponse);
      await HiveFunction().addData(photoResponse);
        return Right(photoResponse);
      } else {
        //var hiveBox = Hive.box<PhotoResponse>(hiveBoxName);
        return Right(HiveFunction().getData);
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(
        ServerFailure(errorMessage: "unknown error , try access later"),
      );
    }*/