part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  final List<PopularMovie> popularMovies;
  final Error? error;

  const PopularMoviesState({
    this.popularMovies = const [],
    this.error,
  });

  @override
  List<Object?> get props => [popularMovies, error];
}

class PopularMoviesInitial extends PopularMoviesState {
  const PopularMoviesInitial();
}

class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

class PopularMoviesSuccess extends PopularMoviesState {
  const PopularMoviesSuccess({super.popularMovies});
}

class PopularMoviesFailed extends PopularMoviesState {
  const PopularMoviesFailed({super.error});
}
