import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_app/core/check_connection/check_connection.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/photo_response.dart';
import 'package:gallery_app/feature/home_screen/data/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/model/api_response/photos.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  @factoryMethod
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  ScrollController scrollController = ScrollController();
  late PhotoResponse photoResponse;
  bool paginationLoading = false;
  int pageNumber = 1;
  late bool connection = true;

  void listenToNetwork() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event.contains(ConnectivityResult.none)) {
        connection = false;
        emit(UpdateConnection());
      } else {
        connection = true;
        emit(UpdateConnection());

      }
    });
  }

  Future<void> getPhotos(int pageNumber) async {
    print(connection);
    emit(GetPhotoLoading());
    var result = await homeRepo.getPhoto(pageNumber);
    result.fold(
      (failure) {
        emit(GetPhotoFailure(errorMessage: failure.errorMessage));
      },
      (result) {
        photoResponse = result;
        emit(GetPhotoSuccess(photos: result.photos!));
      },
    );
  }

  void loadMoreData() async {
    if (photoResponse.nextPage != null) {
      scrollController.addListener(() async {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels == 0) {
            return;
          }
          if(connection){
            paginationLoading = true;
            pageNumber++;
            await getPhotos(pageNumber);
            paginationLoading = false;
          }

        }
      });
    }
  }
}
