import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/usecases/add_watched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_series_use_case.dart';

part 'popular_series_state.dart';

class PopularSeriesCubit extends Cubit<PopularSeriesState> {
  PopularSeriesCubit(
      {required this.getPopularSeriesUseCase,
      required this.addWatchedSerieUseCase})
      : super(PopularSeriesInitial()) {
    getRemoteSeries();
  }

  final GetPopularSeriesUseCase getPopularSeriesUseCase;
  final AddWatchedSerieUseCase addWatchedSerieUseCase;

  void getRemoteSeries() async {
    try {
      emit(PopularSeriesLoading());
      emit(
          PopularSeriesSuccess(series: await getPopularSeriesUseCase.invoke()));
    } catch (e) {
      emit(PopularSeriesFailed());
    }
  }

  void addWatchedSerie(int serieId) {
    addWatchedSerieUseCase.invoke(serieId);
  }
}
