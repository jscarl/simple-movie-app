part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class FetchMovieList extends MovieEvent {
  final String? path;
  final int? page;

  FetchMovieList({this.path, this.page});
}
