import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/popular_serie.dart';
import 'package:movie_memo/src/domain/usecases/add_unwatched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/add_watched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_series_use_case.dart';

part 'popular_series_state.dart';

class PopularSeriesCubit extends Cubit<PopularSeriesState> {
  PopularSeriesCubit(
      {required this.getPopularSeriesUseCase,
      required this.addWatchedSerieUseCase,
      required this.addUnwatchedSerieUseCase})
      : super(PopularSeriesInitial()) {
    getPopularSeries();
  }

  final GetPopularSeriesUseCase getPopularSeriesUseCase;
  final AddWatchedSerieUseCase addWatchedSerieUseCase;
  final AddUnwatchedSerieUseCase addUnwatchedSerieUseCase;

  void getPopularSeries() async {
    try {
      emit(PopularSeriesLoading());
      emit(PopularSeriesSuccess(
          popularSeries: await getPopularSeriesUseCase.invoke()));
    } catch (e) {
      emit(PopularSeriesFailed());
    }
  }

  void addWatchedSerie(int serieId) {
    addWatchedSerieUseCase.invoke(serieId);
  }

  void addUnwatchedSerie(int serieId) {
    addUnwatchedSerieUseCase.invoke(serieId);
  }
}
