import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/usecases/delete_watched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_watched_movies_use_case.dart';

part 'watched_state.dart';

class WatchedCubit extends Cubit<WatchedMoviesState> {
  WatchedCubit(
      {required this.getWatchedMoviesUseCase,
      required this.deleteWatchedMovieUseCase})
      : super(WatchedMoviesInitial()) {
    getWatchedMovie();
  }

  final GetWatchedMoviesUseCase getWatchedMoviesUseCase;
  final DeleteWatchedMovieUseCase deleteWatchedMovieUseCase;

  void getWatchedMovie() async {
    try {
      emit(WatchedMoviesLoading());
      final watchedMovies = await getWatchedMoviesUseCase.invoke();
      emit(WatchedMoviesSuccess(watchMovies: watchedMovies));
    } catch (e) {
      print(e);
      emit(WatchedMoviesFailed());
    }
  }

  void deleteWatchedMovie(int movieId) async {
    deleteWatchedMovieUseCase.invoke(movieId);
    getWatchedMovie();
  }
}
