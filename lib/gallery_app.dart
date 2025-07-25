import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/my_routes/my_routes.dart';
import 'package:gallery_app/core/theme_config/theme.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';
import 'package:gallery_app/feature/splash_screen/presentation/views/splash_screen.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleThemeCubit, ToggleThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          themeMode: BlocProvider.of<ToggleThemeCubit>(context).themeMode,
          home: SplashScreen(),
          onGenerateRoute: MyRoutes.myRoutes,
        );
      },
    );
  }
}
