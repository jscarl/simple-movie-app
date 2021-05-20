import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:http_mock_adapter/src/handlers/request_handler.dart';
import 'package:movie_app/models/base_response.dart';
import 'package:movie_app/models/movie_response.dart';
import 'package:movie_app/services/network_service.dart';

import 'mocks/generic_response.dart';
import 'mocks/popular_movie_response.dart';

void main() {
  late Dio dio;
  late NetworkService _service;
  group('fetch movie request', () {
    late DioAdapter dioAdapter;
    setUpAll(() {
      dioAdapter = DioAdapter();
      dio = Dio()..httpClientAdapter = dioAdapter;
      _service = NetworkService(adapter: dio);
    });

    test('Fetch movie error when path is null', () async {
      expect(_service.getMovies(path: null), throwsAssertionError);
    });

    test('Fetch movie with category popular success', () async {
      const String _path = '/movie/popular';
      dioAdapter.onGet(_path, (RequestHandler request) {
        request.reply(200, mockPopularMovieSuccessResponse);
      });

      final BaseResponse<MovieRes> _res =
          await _service.getMovies(path: _path, page: 1);
      expect(_res, TypeMatcher<BaseResponse<MovieRes>>());
    });

    test('Fetch movie and returned 401 status code', () async {
      const String _path = '/movie/popular';
      dioAdapter.onGet(_path, (RequestHandler request) {
        request.reply(401, mockErrorResponse);
      });

      final BaseResponse<MovieRes> _res =
          await _service.getMovies(path: _path, page: 1);
      expect(_res.statusCode, 401);
      expect(_res.success, false);
    });

    test('Fetch movie with category now playing success', () async {
      const String _path = '/movie/now_playing';
    });
  });
}
