import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/usecases/get_Watched_series_use_case.dart';

part 'watched_series_state.dart';

class WatchedSeriesCubit extends Cubit<WatchedSeriesState> {
  WatchedSeriesCubit({required this.getWatchedSeriesUseCase})
      : super(WatchedSeriesInitial()) {
    getRemoteSeries();
  }

  final GetWatchedSeriesUseCase getWatchedSeriesUseCase;

  void getRemoteSeries() async {
    try {
      emit(WatchedSeriesLoading());
      final series = await getWatchedSeriesUseCase.invoke();
      print(series);
      emit(WatchedSeriesSuccess(series: series));
    } catch (e) {
      print(e);
      emit(WatchedSeriesFailed());
    }
  }
}
