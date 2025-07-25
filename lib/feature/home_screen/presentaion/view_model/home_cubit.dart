import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/Photo_response.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/Photos.dart';
import 'package:gallery_app/feature/home_screen/data/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  @factoryMethod
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  ScrollController scrollController = ScrollController();
  late PhotoResponse photoResponse;
  bool paginationLoading = false;
  int pageNumber =  1;

  Future<void> getPhotos(int pageNumber) async {
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

  void loadMoreData() async{
    if (photoResponse.nextPage != null) {
      scrollController.addListener(() async{
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels == 0) return;
          paginationLoading = true;
          pageNumber++;
          await getPhotos(pageNumber);
          paginationLoading = false;
        }
      });
    }
  }
}
