import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_app/core/app_color/app_colors.dart';
import 'package:gallery_app/core/assets_manegers/assets_manegers.dart';
import 'package:gallery_app/core/di/di.dart';
import 'package:gallery_app/core/helper/loading_dialog.dart';
import 'package:gallery_app/core/widgets/custom_toggle_switch.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/photos.dart';
import 'package:gallery_app/feature/home_screen/presentaion/view_model/home_cubit.dart';
import 'package:gallery_app/feature/home_screen/presentaion/views/error_screen.dart';
import 'package:gallery_app/feature/home_screen/presentaion/views/widget/connection_panner.dart';
import 'package:gallery_app/feature/home_screen/presentaion/views/widget/photo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;
  List<Photos> photos = [];
  int? nullableValue = 0;

  //bool isConnectNetwork = true;

  @override
  void initState() {
    homeCubit = getIt<HomeCubit>();
    loadPhotos();
    super.initState();
  }

  late bool connection = true;

  loadPhotos() async {
    //isConnectNetwork = await CheckConnection().checkNetwork();
    await homeCubit.getPhotos(2);
    homeCubit.listenToNetwork();
    listenToNetwork();
  }

  void listenToNetwork() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event.contains(ConnectivityResult.none)) {
        connection = false;
        setState(() {
          print(connection);
        });
      } else {
        connection = true;
        setState(() {
          print(connection);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ToggleThemeCubit cubit = BlocProvider.of<ToggleThemeCubit>(context);
    return BlocProvider.value(
      value: homeCubit,
      child: Builder(
        builder: (context) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
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
                  bottom: connection ? null : ConnectionPanner(),
                ),
                body: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) async{
                    if (state is GetPhotoSuccess) {
                      photos.addAll(state.photos);
                      await homeCubit.loadMoreData();
                    }
                  },
                  builder: (context, state) {
                    if (state is GetPhotoFailure) {
                      return ErrorScreen(
                        message: state.errorMessage,
                        onRetry: () async {
                          await homeCubit.getPhotos(2);
                        },
                      );
                    }
                    if (state is GetPhotoLoading && photos.isEmpty) {
                      return Center(child: LoadingDialog());
                    }
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 8.0,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          MasonryGridView.count(
                            controller: homeCubit.scrollController,
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            itemCount: photos.length,
                            itemBuilder: (context, index) {
                              return PhotoCard(
                                imageUrl: photos[index].src!.large!,
                                borderRadius: 16,
                              );
                            },
                          ),
                          homeCubit.paginationLoading
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).hintColor,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
