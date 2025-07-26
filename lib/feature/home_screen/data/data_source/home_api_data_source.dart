import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gallery_app/core/api_service/api_constance.dart';
import 'package:gallery_app/core/api_service/api_service.dart';
import 'package:gallery_app/core/check_connection/check_connection.dart';
import 'package:gallery_app/core/failure/failure.dart';
import 'package:gallery_app/core/hive/hive_function.dart';
import 'package:gallery_app/feature/home_screen/data/data_source/home_data_source.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/photo_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeDataSource)
 class HomeApiDataSource extends HomeDataSource {
  @factoryMethod
  HomeApiDataSource();
   @override
   Future<Either<Failure, PhotoResponse>> getPhoto(int pageNumber) async {
     try {
       bool isConnected = await CheckConnection().checkNetwork();
       if (isConnected) {
         //var hiveBox = Hive.box<PhotoResponse>(hiveBoxName);
         //await hiveBox.clear();
         await HiveFunction().clearCache();
         var response = await ApiService().getRequest(
           ApiConstance.photosEndPoint,
            {"page": pageNumber, "per_page": 40},
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
       print(e);
       if (e is DioException) {
         return Left(ServerFailure.fromDioException(e));
       }
       return Left(
         ServerFailure(errorMessage: "unknown error , try access later"),
       );
     }
   }
}