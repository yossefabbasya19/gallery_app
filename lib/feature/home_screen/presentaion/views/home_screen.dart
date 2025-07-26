import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_app/core/assets_manegers/assets_manegers.dart';
import 'package:gallery_app/core/check_connection/check_connection.dart';
import 'package:gallery_app/core/di/di.dart';
import 'package:gallery_app/core/helper/loading_dialog.dart';
import 'package:gallery_app/core/widgets/custom_toggle_switch.dart';
import 'package:gallery_app/core/view_model/toggle_theme_cubit.dart';
import 'package:gallery_app/feature/home_screen/data/model/api_response/photos.dart';
import 'package:gallery_app/feature/home_screen/presentaion/view_model/home_cubit.dart';
import 'package:gallery_app/feature/home_screen/presentaion/views/error_screen.dart';
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

  loadPhotos() async {
    homeCubit.listenToNetwork();
    //isConnectNetwork = await CheckConnection().checkNetwork();
    await homeCubit.getPhotos(1);
    homeCubit.loadMoreData();
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
                  bottom: homeCubit.connection
                      ? null
                      : PreferredSize(
                          preferredSize: Size(double.infinity, 50),
                          child: Container(
                            child: Text(
                              "لا يوجد اتصال بالإنترنت",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
                ),
                body: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    if (state is GetPhotoSuccess) {
                      photos.addAll(state.photos);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetPhotoFailure) {
                      return ErrorScreen(
                        message: state.errorMessage,
                        onRetry: () async {
                          await homeCubit.getPhotos(1);
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
