import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/di/di.dart';
import 'package:gallery_app/core/shared_pref/shared_prefs.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';
import 'package:gallery_app/gallery_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  configureDependencies();
  runApp(
    BlocProvider(create: (context) => ToggleThemeCubit(), child: GalleryApp()),
  );
}
