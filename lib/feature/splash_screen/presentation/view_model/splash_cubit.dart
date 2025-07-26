import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_app/core/my_routes/my_routes.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';
@Injectable()
class SplashCubit extends Cubit<SplashState> {
  @factoryMethod
  SplashCubit() : super(SplashInitial());
  void navigation(BuildContext context){
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MyRoutes.homeScreen);
    });
  }
}
