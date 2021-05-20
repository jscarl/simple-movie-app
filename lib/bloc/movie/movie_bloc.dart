import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/base_response.dart';
import 'package:movie_app/models/movie_response.dart';
import 'package:movie_app/services/network_service.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  NetworkService networkService = NetworkService();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchMovieList) {
      try {
        final BaseResponse<MovieRes> _res =
            await networkService.getMovies(path: event.path, page: event.page);

        if (_res.statusCode == 200) {
          if (_res.data!.results!.isNotEmpty) {
            yield MovieDataLoaded(movies: _res.data!.results);
          } else {
            yield MovieDataEmpty(message: 'Data empty');
          }
        }
      } catch (e) {
        yield MovieDataError(errorMessage: e.toString());
      }
    }
  }
}
