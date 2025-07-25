import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_app/core/assets_manegers/assets_manegers.dart';
import 'package:gallery_app/core/di/di.dart';
import 'package:gallery_app/core/helper/loading_dialog.dart';
import 'package:gallery_app/core/helper/show_snack_bar.dart';
import 'package:gallery_app/core/widgets/custom_toggle_switch.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/Photos.dart';
import 'package:gallery_app/feature/home_screen/presentaion/view_model/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;
  List<Photos> photos = [];
  int? nullableValue = 0;

  @override
  void initState() {
    homeCubit = getIt<HomeCubit>();
    loadPhotos();
    super.initState();
  }

  loadPhotos() async {
    await homeCubit.getPhotos(1);
  }

  @override
  Widget build(BuildContext context) {
    ToggleThemeCubit cubit = BlocProvider.of<ToggleThemeCubit>(context);
    return BlocProvider.value(
      value: homeCubit,
      child: Builder(
        builder: (context) {
          return Scaffold(
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
            body: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is GetPhotoFailure) {
                  showSnackBar(context, state.errorMessage);
                }
                if (state is GetPhotoSuccess) {
                  photos.addAll(state.photos);
                  print(photos);
                }
              },
              builder: (context, state) {
                if (state is GetPhotoLoading && photos.isEmpty) {
                  return Center(child: LoadingDialog());
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: photos[index].src!.original!,
                          placeholder: (context, url) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).hintColor,
                              ),
                            );
                          },
                          fadeInCurve: Curves.easeInBack,
                          errorWidget: (context, url, error) =>
                              Container(child: Icon(Icons.error)),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
