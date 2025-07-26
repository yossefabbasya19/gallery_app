import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/app_color/app_colors.dart';
import 'package:gallery_app/core/assets_manegers/assets_manegers.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({super.key});

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  late ToggleThemeCubit cubit = BlocProvider.of<ToggleThemeCubit>(context);
  late Color sunIconColor;
  late Color moonIconColor;

  @override
  void initState() {
    loadColor();
    super.initState();
  }

  loadColor() {
    sunIconColor = cubit.themeMode == ThemeMode.light
        ? AppColors.white
        : AppColors.white;
    moonIconColor = cubit.themeMode == ThemeMode.light
        ? AppColors.blue
        : AppColors.black;
    nullableValue = cubit.themeMode == ThemeMode.light?0:1;
    setState(() {});
  }

  late int nullableValue ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleThemeCubit, ToggleThemeState>(
      builder: (context, state) {
        print(cubit.themeMode);
        return AnimatedToggleSwitch<int?>.rolling(
          style: ToggleStyle(
            indicatorColor: Theme.of(context).hintColor,
            borderColor: Theme.of(context).hintColor,
            backgroundColor: Colors.transparent,
          ),
          height: MediaQuery.sizeOf(context).height * 0.05,
          allowUnlistedValues: false,
          styleAnimationType: AnimationType.onHover,
          current: nullableValue,
          values: const [0, 1],
          onChanged: (i) {
            if (i == 0) {
              BlocProvider.of<ToggleThemeCubit>(
                context,
              ).toggleThemeMode(ThemeMode.light);
              sunIconColor = cubit.themeMode == ThemeMode.light
                  ? AppColors.white
                  : AppColors.black;
              moonIconColor = cubit.themeMode == ThemeMode.light
                  ? AppColors.blue
                  : AppColors.white;

            } else {
              BlocProvider.of<ToggleThemeCubit>(
                context,
              ).toggleThemeMode(ThemeMode.dark);
              sunIconColor = cubit.themeMode == ThemeMode.light
                  ? AppColors.blue
                  : AppColors.white;
              moonIconColor = cubit.themeMode == ThemeMode.light
                  ? AppColors.white
                  : AppColors.black;

            }
            nullableValue = i!;
            setState(() {});
          },
          padding: EdgeInsets.zero,
          iconBuilder: (value, foreground) {
            if (value == 0) {
              return Image(
                color: sunIconColor,
                image: AssetImage(AssetsManagers.sunLogoLight),
                fit: BoxFit.fill,
              );
            } else {
              return Image(
                color: moonIconColor,
                image: AssetImage(AssetsManagers.moonLogoLight),
                fit: BoxFit.fill,
              );
            }
          },
        );
      },
    );
  }
}
