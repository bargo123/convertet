// @dart=2.9
import 'package:converter/locator.dart';
import 'package:converter/src/core/database/db_operations.dart';
import 'package:converter/src/models/country_model.dart';
import 'package:converter/src/services/data/convert_service.dart';
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
    final response = await fakeResponse({"EUR_USD": 0.7});
    when(callDio()).thenAnswer((_) => Future.value(response));
    when(getIt<DbOperations>().getAll<CountryModel>()).thenAnswer((_) => []);
    var data = await ConvertService().currencyConverter(100, "EUR", "USD");
    final request = verifyDioHaveBeenCalled();
    expect(data, "70.000");
  });
}
