import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/popular_movie.dart';
import 'package:movie_memo/src/domain/usecases/add_unwatched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/add_watched_movie_use_case.dart';

import '../../../domain/usecases/get_popular_movies_use_case.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(
      {required this.getPopularMoviesUseCase,
      required this.addUnwatchedMovieUseCase,
      required this.addWatchedMovieUseCase})
      : super(PopularMoviesInitial()) {
    getPopularMovies();
  }

  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final AddUnwatchedMovieUseCase addUnwatchedMovieUseCase;
  final AddWatchedMovieUseCase addWatchedMovieUseCase;

  void getPopularMovies() async {
    try {
      emit(PopularMoviesLoading());
      final popularMovies = await getPopularMoviesUseCase.invoke();
      emit(PopularMoviesSuccess(popularMovies: popularMovies));
    } catch (e) {
      emit(PopularMoviesFailed());
    }
  }

  void addWatchedMovie(int movieId) {
    addWatchedMovieUseCase.invoke(movieId);
  }

  void addUnwatchedMovie(int movieId) {
    addUnwatchedMovieUseCase.invoke(movieId);
  }
}
