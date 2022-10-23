import 'package:converter/locator.dart';
import 'package:converter/src/core/constants/api_constants.dart';
import 'package:converter/src/core/database/db_operations.dart';
import 'package:converter/src/enums/http_enum.dart';
import 'package:converter/src/models/country_model.dart';
import 'package:converter/src/core/repository/http_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCurrenciesService {
  Future<CountryModel> getCountryData() async {
    CountryModel? curr;
    curr?.country = getIt<DbOperations>().getAll<CountryResult>() ?? [];
    if (curr?.country?.isEmpty ?? true) {
      var data = await getIt<HttpRepo>().makeRequest(
          requestType: HttpRequestEnum.GET,
          methodName: ApiConstants.countries,
          getQueryParam: {"apiKey": "pr_ca566c61d9a841d6a37b94ecde245a35"});
      print(data);
      curr = CountryModel.fromJson(data);
      writeToDp(curr.country ?? []);
    }
    return curr!;
  }

  void writeToDp(List<CountryResult> countryData) {
    getIt<DbOperations>().putData<CountryResult>(countryData);
  }
}
