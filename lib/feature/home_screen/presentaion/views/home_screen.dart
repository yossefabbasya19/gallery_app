import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/assets_manegers/assets_manegers.dart';
import 'package:gallery_app/core/widgets/custom_toggle_switch.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? nullableValue = 0;

  @override
  Widget build(BuildContext context) {
    ToggleThemeCubit cubit = BlocProvider.of<ToggleThemeCubit>(context);
    return Scaffold(
      //body: Text("data"),
      appBar: AppBar(
        title: Image(
          image: AssetImage(
            cubit.themeMode == ThemeMode.light
                ? AssetsManagers.appLogoLight
                : AssetsManagers.appLogo,
          ),
          height: MediaQuery.sizeOf(context).height * 0.05,
        ),
        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.2,
            height: MediaQuery.sizeOf(context).height * 0.038,
            child: CustomToggleSwitch(),
          ),
          Padding(padding: EdgeInsetsGeometry.only(right: 12)),
        ],
      ),
    );
  }
}
