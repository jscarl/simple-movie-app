import 'package:dio/dio.dart';
import 'package:movie_app/models/base_response.dart';
import 'package:movie_app/models/movie_response.dart';
import 'package:movie_app/utils/generic_exception.dart';
import 'package:movie_app/utils/network_exception.dart';

const String baseUrl = 'https://api.themoviedb.org/3';
const String apiKey = 'c5a8fb7b6e0904f027e8e51d22fe5298';

class NetworkService {
  static const CONNECTION_TIME_OUT = 5 * 1000;
  static const RECEIVE_TIME_OUT = 3 * 1000;

  late Dio _dio = Dio();

  NetworkService({Dio? adapter}) {
    if (adapter != null) {
      _dio = adapter;
    }
    _dio.options = _dioConfigure;
  }

  static BaseOptions get _dioConfigure {
    return BaseOptions(
      baseUrl: '',
      connectTimeout: CONNECTION_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
    );
  }

  Future<BaseResponse<MovieRes>> getMovies({
    String? path,
    String region = 'ID',
    int? page = 1,
  }) async {
    assert(path != null, 'url is required');

    try {
      final Map<String, dynamic> _body = {
        'api_key': apiKey,
        'language': 'en-US',
        'page': page,
        'region': region,
      };
      final Response _response = await _dio.request(
        baseUrl + path!,
        queryParameters: _body,
      );
      if (_response.statusCode != 200) {
        return BaseResponse<MovieRes>(
          statusCode: _response.statusCode,
          success: false,
          statusMessage: _response.statusMessage,
        );
      }

      return BaseResponse<MovieRes>(
        statusCode: _response.statusCode,
        data: MovieRes.fromJson(_response.data),
        success: true,
      );
    } on DioError catch (error) {
      throw NetworkException(error: error);
    } on Exception catch (error) {
      throw UnknownException(message: error.toString());
    }
  }
}
