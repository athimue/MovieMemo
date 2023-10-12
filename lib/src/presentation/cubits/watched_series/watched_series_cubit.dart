import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/usecases/delete_watched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_Watched_series_use_case.dart';

part 'watched_series_state.dart';

class WatchedSeriesCubit extends Cubit<WatchedSeriesState> {
  WatchedSeriesCubit(
      {required this.getWatchedSeriesUseCase,
      required this.deleteWatchedSerieUseCase})
      : super(WatchedSeriesInitial()) {
    getWatchedSeries();
  }

  final GetWatchedSeriesUseCase getWatchedSeriesUseCase;
  final DeleteWatchedSerieUseCase deleteWatchedSerieUseCase;

  void getWatchedSeries() async {
    try {
      emit(WatchedSeriesLoading());
      final series = await getWatchedSeriesUseCase.invoke();
      emit(WatchedSeriesSuccess(watchSeries: series));
    } catch (e) {
      print(e);
      emit(WatchedSeriesFailed());
    }
  }

  void deleteWatchedSerie(int serieId) async {
    deleteWatchedSerieUseCase.invoke(serieId);
    getWatchedSeries();
  }
}
