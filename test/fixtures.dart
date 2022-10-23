// @dart=2.9

import 'dart:convert';

import 'package:converter/locator.dart';
import 'package:converter/src/database/db_operations.dart';
import 'package:converter/src/repository/http_repo.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class DioAdapterMock extends Mock implements DefaultHttpClientAdapter {}

class MockDbOperations extends Mock implements DbOperations {}

class MockDio extends Mock implements Dio {}

Future<ResponseBody> fakeResponse(Map<String, dynamic> body,
    [int statusCode = 200, dynamic headers = const [Headers.jsonContentType]]) async {
  final responsePayload = jsonEncode(body);
  return ResponseBody.fromString(
    responsePayload,
    statusCode,
    headers: {Headers.contentTypeHeader: headers},
  );
}

Future basicMockService() async {
  await getIt.reset();
  getIt.registerSingleton<DbOperations>(MockDbOperations());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<HttpRepo>(HttpRepo());
  final dio = getIt<Dio>();
  dio.httpClientAdapter = DioAdapterMock();
}

Future<ResponseBody> callDio() async {
  final dio = getIt<Dio>();
  return dio.httpClientAdapter.fetch(captureAny, any, any);
}

RequestOptions verifyDioHaveBeenCalled() {
  return verify(callDio()).captured[0];
}
