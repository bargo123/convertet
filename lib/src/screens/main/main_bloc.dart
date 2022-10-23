import 'dart:async';

import 'package:converter/locator.dart';
import 'package:converter/src/models/country_model.dart';
import 'package:converter/src/services/data/convert_service.dart';
import 'package:converter/src/services/data/get_currencies_service.dart';
import 'package:injectable/injectable.dart';

import '../../enums/favourites_enum.dart';

@Injectable()
class MainBloc {
  CountryModel? _listOfCountries;
  String _countryFrom = "";
  String _countryTo = "";

  final StreamController<LoadingStatus> _loadingStatusController = StreamController<LoadingStatus>.broadcast();
  final StreamController<CountryResult> _selectedFromCountryController = StreamController<CountryResult>.broadcast();
  final StreamController<CountryResult> _selectedToCountryController = StreamController<CountryResult>.broadcast();
  CountryModel? get listOfCountries => _listOfCountries;
  Stream<LoadingStatus> get loadingStatusStream => _loadingStatusController.stream;
  Stream<CountryResult> get selectedToCountryStream => _selectedToCountryController.stream;
  Stream<CountryResult> get selectedFromCountryStream => _selectedFromCountryController.stream;

  set setCountryFrom(CountryResult country) {
    _countryFrom = country.currencyId ?? "";
    _selectedFromCountryController.sink.add(country);
  }

  set setCountryTo(CountryResult country) {
    _countryTo = country.currencyId ?? "";

    _selectedToCountryController.sink.add(country);
  }

  Future<void> getCountries() async {
    _listOfCountries = await getIt<GetCurrenciesService>().getCountryData();
    _loadingStatusController.sink.add(LoadingStatus.Finished);
  }

  Future<String> convert(String value) async {
    var data = "";
    if (value.isNotEmpty && _countryFrom.isNotEmpty && _countryTo.isNotEmpty) {
      if (double.tryParse(value) != null) {
        data = await getIt<ConvertService>().currencyConverter(double.parse(value), _countryFrom, _countryTo);
      }
    }
    return data;
  }
}
