part of 'watched_cubit.dart';

abstract class WatchedMoviesState extends Equatable {
  final List<Movie> watchMovies;
  final Error? error;

  const WatchedMoviesState({
    this.watchMovies = const [],
    this.error,
  });

  @override
  List<Object?> get props => [watchMovies, error];
}

class WatchedMoviesInitial extends WatchedMoviesState {
  const WatchedMoviesInitial();
}

class WatchedMoviesLoading extends WatchedMoviesState {
  const WatchedMoviesLoading();
}

class WatchedMoviesSuccess extends WatchedMoviesState {
  const WatchedMoviesSuccess({super.watchMovies});
}

class WatchedMoviesFailed extends WatchedMoviesState {
  const WatchedMoviesFailed({super.error});
}
