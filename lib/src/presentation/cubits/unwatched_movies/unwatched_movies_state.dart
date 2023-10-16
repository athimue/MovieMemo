part of 'unwatched_movies_cubit.dart';

abstract class UnwatchedMoviesState extends Equatable {
  final List<Movie> unwatchedMovies;
  final Error? error;

  const UnwatchedMoviesState({
    this.unwatchedMovies = const [],
    this.error,
  });

  @override
  List<Object?> get props => [unwatchedMovies, error];
}

class UnwatchedMoviesInitial extends UnwatchedMoviesState {
  const UnwatchedMoviesInitial();
}

class UnwatchedMoviesLoading extends UnwatchedMoviesState {
  const UnwatchedMoviesLoading();
}

class UnwatchedMoviesSuccess extends UnwatchedMoviesState {
  const UnwatchedMoviesSuccess({super.unwatchedMovies});
}

class UnwatchedMoviesFailed extends UnwatchedMoviesState {
  const UnwatchedMoviesFailed({super.error});
}
