part of 'movie_bloc.dart';

@immutable
abstract class MovieState {
  Object get props => [];
}

class MovieInitial extends MovieState {}

class MovieDataLoaded extends MovieState {
  final List<Result>? movies;

  MovieDataLoaded({this.movies});

  @override
  Object get props => [movies];
}

class MovieDataEmpty extends MovieState {
  final String? message;

  MovieDataEmpty({this.message});

  @override
  Object get props => [message];
}

class MovieDataError extends MovieState {
  final String? errorMessage;

  MovieDataError({this.errorMessage});

  @override
  Object get props => [errorMessage];
}
