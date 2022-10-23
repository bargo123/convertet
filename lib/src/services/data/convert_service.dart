import 'dart:math';

import 'package:injectable/injectable.dart';

import '../../../locator.dart';
import '../../core/constants/api_constants.dart';
import '../../core/enums/http_enum.dart';
import '../../core/repository/http_repo.dart';

@Singleton()
class ConvertService {
  Future<String> currencyConverter(double value, String from, String to) async {
    String currency = "${from}_$to";
    Map<String, dynamic> data = await getIt<HttpRepo>().makeRequest(
        requestType: HttpRequestEnum.GET,
        methodName: ApiConstants.convert,
        getQueryParam: {"q": currency, "compact": "ultra", "apiKey": "pr_ca566c61d9a841d6a37b94ecde245a35"});
    return (value * data[currency]).toStringAsFixed(3);
  }
}
