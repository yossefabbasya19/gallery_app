import 'package:flutter/material.dart';
import 'package:gallery_app/feature/home_screen/presentaion/views/home_screen.dart';
import 'package:gallery_app/feature/display_image/presentation/views/display_image.dart';

abstract class MyRoutes {
  static const String homeScreen = "/homeScreen";
  static const String photoDetails = "/photoDetails";

  static Route<dynamic>? myRoutes(RouteSettings setting) {
    switch (setting.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case photoDetails:
        return MaterialPageRoute(
          builder: (context) =>
              DisplayImage(imageUrl: setting.arguments as String),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
