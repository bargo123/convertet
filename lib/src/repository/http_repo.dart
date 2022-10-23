import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../locator.dart';
import '../enums/http_enum.dart';

@Singleton()
class HttpRepo {
  Future<dynamic> makeRequest(
      {required HttpRequestEnum requestType,
      required String methodName,
      Map<String, dynamic> getQueryParam = const {},
      Map<String, dynamic>? postBody,
      String contentType = Headers.jsonContentType}) async {
    Response? result;
    Dio dioClient = getIt<Dio>();
    dioClient.options = BaseOptions(
        baseUrl: "https://free.currconv.com/api/v7/",
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        });

    switch (requestType) {
      case HttpRequestEnum.GET:
        result = await dioClient.get(
          methodName,
          queryParameters: getQueryParam,
          options: Options(contentType: contentType),
        );
        break;
      case HttpRequestEnum.POST:
        break;
    }
    switch (result?.statusCode) {
      case 200:
        return result;
      case 400:
        throw Exception(result?.data["error"]);
    }
  }
}
