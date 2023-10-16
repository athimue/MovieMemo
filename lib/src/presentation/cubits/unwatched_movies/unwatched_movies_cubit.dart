import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/usecases/delete_unwatched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_unwatched_movies_use_case.dart';
import 'package:movie_memo/src/domain/usecases/watch_movie_use_case.dart';

part 'unwatched_movies_state.dart';

class UnwatchedMoviesCubit extends Cubit<UnwatchedMoviesState> {
  UnwatchedMoviesCubit(
      {required this.getUnwatchedMoviesUseCase,
      required this.deleteUnwatchedMovieUseCase,
      required this.watchMovieUseCase})
      : super(UnwatchedMoviesInitial()) {
    getUnwatchedMovies();
  }

  final GetUnwatchedMoviesUseCase getUnwatchedMoviesUseCase;
  final DeleteUnwatchedMovieUseCase deleteUnwatchedMovieUseCase;
  final WatchMovieUseCase watchMovieUseCase;

  void getUnwatchedMovies() async {
    try {
      emit(UnwatchedMoviesLoading());
      final unwatchedMovies = await getUnwatchedMoviesUseCase.invoke();
      emit(UnwatchedMoviesSuccess(unwatchedMovies: unwatchedMovies));
    } catch (e) {
      print(e);
      emit(UnwatchedMoviesFailed());
    }
  }

  void deleteUnwatchedMovie(int movieId) async {
    deleteUnwatchedMovieUseCase.invoke(movieId);
    getUnwatchedMovies();
  }

  void watchMovie(int movieId) async {
    watchMovieUseCase.invoke(movieId);
    getUnwatchedMovies();
  }
}
