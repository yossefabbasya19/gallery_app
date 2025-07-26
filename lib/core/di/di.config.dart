// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/home_screen/data/data_source/home_api_data_source.dart'
    as _i244;
import '../../feature/home_screen/data/data_source/home_data_source.dart'
    as _i716;
import '../../feature/home_screen/data/repo/home_repo.dart' as _i479;
import '../../feature/home_screen/data/repo/home_repo_imple.dart' as _i202;
import '../../feature/home_screen/presentaion/view_model/home_cubit.dart'
    as _i596;
import '../../feature/splash_screen/presentation/view_model/splash_cubit.dart'
    as _i496;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i496.SplashCubit>(() => _i496.SplashCubit());
    gh.factory<_i716.HomeDataSource>(() => _i244.HomeApiDataSource());
    gh.factory<_i479.HomeRepo>(
        () => _i202.HomeRepoImple(gh<_i716.HomeDataSource>()));
    gh.factory<_i596.HomeCubit>(() => _i596.HomeCubit(gh<_i479.HomeRepo>()));
    return this;
  }
}
