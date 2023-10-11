import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_series_use_case.dart';

part 'popular_series_state.dart';

class PopularSeriesCubit extends Cubit<PopularSeriesState> {
  PopularSeriesCubit({required this.getPopularSeriesUseCase})
      : super(PopularSeriesInitial()) {
    getRemoteSeries();
  }

  final GetPopularSeriesUseCase getPopularSeriesUseCase;

  void getRemoteSeries() async {
    try {
      emit(PopularSeriesLoading());
      final series = await getPopularSeriesUseCase.invoke();
      emit(PopularSeriesSuccess(series: series));
    } catch (e) {
      emit(PopularSeriesFailed());
    }
  }
}
