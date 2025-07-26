import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/di/di.dart';
import 'package:gallery_app/core/shared_pref/shared_prefs.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/photo_response.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/photos.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/src.dart';
import 'package:gallery_app/gallery_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
String hiveBoxName = "'photo_response_box'";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  await Hive.initFlutter();
  Hive.registerAdapter(SrcAdapter());
  Hive.registerAdapter(PhotosAdapter());
  Hive.registerAdapter(PhotoResponseAdapter());
  await Hive.openBox<PhotoResponse>(hiveBoxName);
  configureDependencies();
  runApp(
    BlocProvider(create: (context) => ToggleThemeCubit(), child: GalleryApp()),
  );
}
