// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/home_screen/data/repo/home_repo.dart' as _i479;
import '../../feature/home_screen/data/repo/home_repo_imple.dart' as _i202;
import '../../feature/home_screen/presentaion/view_model/home_cubit.dart'
    as _i596;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i479.HomeRepo>(() => _i202.HomeRepoImple());
    gh.factory<_i596.HomeCubit>(() => _i596.HomeCubit(gh<_i479.HomeRepo>()));
    return this;
  }
}
