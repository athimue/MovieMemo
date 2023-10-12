import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/usecases/delete_unwatched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_unwatched_series_use_case.dart';
import 'package:movie_memo/src/domain/usecases/watch_serie_use_case.dart';

part 'unwatched_series_state.dart';

class UnwatchedSeriesCubit extends Cubit<UnwatchedSeriesState> {
  UnwatchedSeriesCubit(
      {required this.getUnwatchedSeriesUseCase,
      required this.deleteUnwatchedSerieUseCase,
      required this.watchSerieUseCase})
      : super(UnwatchedSeriesInitial()) {
    getUnwatchedSeries();
  }

  final GetUnwatchedSeriesUseCase getUnwatchedSeriesUseCase;
  final DeleteUnwatchedSerieUseCase deleteUnwatchedSerieUseCase;
  final WatchSerieUseCase watchSerieUseCase;

  void getUnwatchedSeries() async {
    try {
      emit(UnwatchedSeriesLoading());
      final unwatchedSeries = await getUnwatchedSeriesUseCase.invoke();
      print(unwatchedSeries);
      emit(UnwatchedSeriesSuccess(unwatchedSeries: unwatchedSeries));
    } catch (e) {
      print(e);
      emit(UnwatchedSeriesFailed());
    }
  }

  void deleteUnwatchedSerie(int serieId) async {
    deleteUnwatchedSerieUseCase.invoke(serieId);
    getUnwatchedSeries();
  }

  void watchSerie(int serieId) async {
    watchSerieUseCase.invoke(serieId);
    getUnwatchedSeries();
  }
}
