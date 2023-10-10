import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

part 'remote_series_state.dart';

class RemoteSeriesCubit extends Cubit<RemoteSeriesState> {
  RemoteSeriesCubit({required this.serieRepository})
      : super(RemoteSeriesInitial()) {
    getRemoteSeries();
  }

  final SerieRepository serieRepository;

  void getRemoteSeries() async {
    try {
      emit(RemoteSeriesLoading());
      final series = await serieRepository.getSeries();
      emit(RemoteSeriesSuccess(series: series));
    } catch (e) {
      emit(RemoteSeriesFailed());
    }
  }
}
