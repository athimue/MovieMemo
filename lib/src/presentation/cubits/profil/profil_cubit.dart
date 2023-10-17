import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/usecases/get_unwatched_movies_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_unwatched_series_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_watched_movies_use_case.dart';
import 'package:movie_memo/src/domain/usecases/watched_series_use_case.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit(
      {required this.getUnwatchedMoviesUseCase,
      required this.getWatchedMoviesUseCase,
      required this.getUnwatchedSeriesUseCase,
      required this.getWatchedSeriesUseCase})
      : super(ProfilInitial()) {
    loadData();
  }

  final GetUnwatchedMoviesUseCase getUnwatchedMoviesUseCase;
  final GetWatchedMoviesUseCase getWatchedMoviesUseCase;
  final GetUnwatchedSeriesUseCase getUnwatchedSeriesUseCase;
  final GetWatchedSeriesUseCase getWatchedSeriesUseCase;

  void loadData() async {
    try {
      emit(ProfilLoading());
      final unwatchedMovies = await getUnwatchedMoviesUseCase.invoke();
      final watchedMovies = await getWatchedMoviesUseCase.invoke();
      final unwatchedSeries = await getUnwatchedSeriesUseCase.invoke();
      final watchedSeries = await getWatchedSeriesUseCase.invoke();
      emit(ProfilSuccess(
          unwatchedMovies: unwatchedMovies,
          watchedMovies: watchedMovies,
          unwatchedSeries: unwatchedSeries,
          watchedSeries: watchedSeries));
    } catch (e) {
      emit(ProfilFailed());
    }
  }
}
