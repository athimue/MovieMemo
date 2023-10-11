part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  final List<Movie> movies;
  final Error? error;

  const PopularMoviesState({
    this.movies = const [],
    this.error,
  });

  @override
  List<Object?> get props => [movies, error];
}

class PopularMoviesInitial extends PopularMoviesState {
  const PopularMoviesInitial();
}

class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

class PopularMoviesSuccess extends PopularMoviesState {
  const PopularMoviesSuccess({super.movies});
}

class PopularMoviesFailed extends PopularMoviesState {
  const PopularMoviesFailed({super.error});
}
