import 'package:flutter/material.dart';
import 'package:gallery_app/core/assets_manegers/assets_manegers.dart';
import 'package:gallery_app/core/my_routes/my_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, MyRoutes.homeScreen);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image(image: AssetImage(AssetsManagers.appLogo)),
            Spacer(),
            Text(
              "Supervised by Mohamed Nabil",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.04,)
          ],
        ),
      ),
    );
  }
}
