import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

part 'popular_series_state.dart';

class PopularSeriesCubit extends Cubit<PopularSeriesState> {
  PopularSeriesCubit({required this.serieRepository})
      : super(PopularSeriesInitial()) {
    getRemoteSeries();
  }

  final SerieRepository serieRepository;

  void getRemoteSeries() async {
    try {
      emit(PopularSeriesLoading());
      final series = await serieRepository.getSeries();
      emit(PopularSeriesSuccess(series: series));
    } catch (e) {
      emit(PopularSeriesFailed());
    }
  }
}
