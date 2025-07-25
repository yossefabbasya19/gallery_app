import 'package:flutter/material.dart';
import 'package:gallery_app/core/my_routes/my_routes.dart';
import 'package:gallery_app/core/theme_config/theme.dart';
import 'package:gallery_app/feature/splash_screen/presentation/views/splash_screen.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode:ThemeMode.dark ,
      home: SplashScreen(),
      onGenerateRoute: MyRoutes.myRoutes ,
    );
  }
}
