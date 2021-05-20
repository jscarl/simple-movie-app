import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkException {
  NetworkException({this.error});

  final DioError? error;

  String toString() {
    return "Network Exception :\n" +
        jsonEncode({
          'message': error?.message,
          'url': error?.requestOptions.uri,
          'response': error?.response.toString(),
        });
  }
}
