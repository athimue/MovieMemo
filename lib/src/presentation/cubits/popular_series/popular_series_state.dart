part of 'popular_series_cubit.dart';

abstract class PopularSeriesState extends Equatable {
  final List<PopularSerie> popularSeries;
  final Error? error;

  const PopularSeriesState({
    this.popularSeries = const [],
    this.error,
  });

  @override
  List<Object?> get props => [popularSeries, error];
}

class PopularSeriesInitial extends PopularSeriesState {
  const PopularSeriesInitial();
}

class PopularSeriesLoading extends PopularSeriesState {
  const PopularSeriesLoading();
}

class PopularSeriesSuccess extends PopularSeriesState {
  const PopularSeriesSuccess({super.popularSeries});
}

class PopularSeriesFailed extends PopularSeriesState {
  const PopularSeriesFailed({super.error});
}
