// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'src/database/db_operations.dart' as _i9;
import 'src/database/object_box.dart' as _i8;
import 'src/repository/http_repo.dart' as _i6;
import 'src/screens/main/main_bloc.dart' as _i7;
import 'src/services/data/convert_service.dart' as _i4;
import 'src/services/data/get_currencies_service.dart' as _i5;
import 'src/utils/bottom_sheets_util.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.BottomSheetsUtil>(_i3.BottomSheetsUtil());
  gh.singleton<_i4.ConvertService>(_i4.ConvertService());
  gh.factory<_i5.GetCurrenciesService>(() => _i5.GetCurrenciesService());
  gh.singleton<_i6.HttpRepo>(_i6.HttpRepo());
  gh.factory<_i7.MainBloc>(() => _i7.MainBloc());
  gh.factoryAsync<_i8.ObjectBox>(() => _i8.ObjectBox.create());
  gh.singletonAsync<_i9.DbOperations>(
      () async => _i9.DbOperations(await get.getAsync<_i8.ObjectBox>()));
  return get;
}
