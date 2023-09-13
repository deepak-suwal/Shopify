// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_assignment/config/app_config.dart' as _i3;
import 'package:flutter_assignment/core/injection/register_module.dart' as _i10;
import 'package:flutter_assignment/core/network/dio_client.dart' as _i4;
import 'package:flutter_assignment/features/product/data/repository/product_repository.dart'
    as _i6;
import 'package:flutter_assignment/features/product/domain/controller/i_product_controller.dart'
    as _i8;
import 'package:flutter_assignment/features/product/domain/repository/i_product_repository.dart'
    as _i5;
import 'package:flutter_assignment/features/product/presentation/bloc/product_bloc.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppConfig>(() => _i3.AppConfig());
    gh.singleton<_i4.DioClient>(registerModule.dioClient);
    gh.factory<_i5.IProductRepository>(() => _i6.ProductRepository());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i8.IProductController>(
        () => _i8.ProductController(gh<_i5.IProductRepository>()));
    gh.factory<_i9.ProductBloc>(
        () => _i9.ProductBloc(gh<_i8.IProductController>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
