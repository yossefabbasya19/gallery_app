import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/assets_manegers/assets_manegers.dart';
import 'package:gallery_app/core/my_routes/my_routes.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MyRoutes.homeScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToggleThemeCubit cubit = BlocProvider.of<ToggleThemeCubit>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image(
              image: AssetImage(
                cubit.themeMode == ThemeMode.light
                    ? AssetsManagers.appLogoLight
                    : AssetsManagers.appLogo,
              ),
            ),
            Spacer(),
            Text(
              "Supervised by Mohamed Nabil",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
          ],
        ),
      ),
    );
  }
}
