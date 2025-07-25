import 'package:bloc/bloc.dart';
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

  getPhotos(int pageNumber) async {
    emit(GetPhotoLoading());
    var result = await homeRepo.getPhoto(pageNumber);
    result.fold(
      (failure) {
        emit(GetPhotoFailure(errorMessage: failure.errorMessage));
      },
      (result) {
        emit(GetPhotoSuccess(photos: result.photos!));
      },
    );
  }
}
