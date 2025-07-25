import 'package:flutter/material.dart';
import 'package:gallery_app/feature/home_screen/presentaion/views/home_screen.dart';

abstract class MyRoutes {
  static const String homeScreen = "/homeScreen";

  static Route<dynamic>? myRoutes(RouteSettings setting) {
    switch (setting.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
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
