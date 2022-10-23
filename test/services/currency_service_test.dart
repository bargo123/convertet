// @dart=2.9
import 'package:converter/locator.dart';
import 'package:converter/src/database/db_operations.dart';
import 'package:converter/src/models/country_model.dart';
import 'package:converter/src/services/data/get_currencies_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../fixtures.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() async {
    await basicMockService();
  });

  test('get currencies', () async {
    final response = await fakeResponse({
      "results": {
        "PT": {
          "alpha3": "PRT",
          "currencyId": "EUR",
          "currencyName": "European euro",
          "currencySymbol": "€",
          "id": "PT",
          "name": "Portugal"
        },
      }
    });
    when(callDio()).thenAnswer((_) => Future.value(response));
    when(getIt<DbOperations>().getAll<CountryModel>()).thenAnswer((_) => []);
    var data = await GetCurrenciesService().getCountryData();
    final request = verifyDioHaveBeenCalled();
    expect(data.country.first.currencyId, "EUR");
  });
}
