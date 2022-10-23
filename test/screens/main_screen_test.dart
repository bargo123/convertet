// @dart=2.9
import 'package:converter/locator.dart';
import 'package:converter/main.dart';
import 'package:converter/src/models/country_model.dart';
import 'package:converter/src/screens/main/main_bloc.dart';
import 'package:converter/src/services/data/convert_service.dart';
import 'package:converter/src/services/data/get_currencies_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../fixtures.dart';

class MockGetCurrencies extends Mock implements GetCurrenciesService {}

class MockConvertService extends Mock implements ConvertService {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() async {
    // ignore: await_only_futures
    await basicMockService();
    getIt.registerSingleton<GetCurrenciesService>(MockGetCurrencies());
    getIt.registerSingleton<ConvertService>(MockConvertService());
  });

  test("Get All Currencies", () async {
    MainBloc mainBloc = MainBloc();
    when(getIt<GetCurrenciesService>().getCountryData()).thenAnswer((realInvocation) => Future.value(
        CountryModel(country: [CountryResult(alpha3: "A", currencyId: "B", currencyName: "C", currencySymbol: "D", uid: "E")])));
    await mainBloc.getCountries();
    expect(mainBloc.listOfCountries.country.first.alpha3, "A");
  });

  test("convertCurrencies", () async {
    MainBloc mainBloc = MainBloc();
    when(getIt<ConvertService>().currencyConverter(any, any, any)).thenAnswer((realInvocation) => Future.value("30"));
    mainBloc.setCountryFrom = CountryResult(currencyId: "Aud");
    mainBloc.setCountryTo = CountryResult(currencyId: "USD");
    var convertedValue = await mainBloc.convert("1.5");
    expect(convertedValue, "30");
  });
}
