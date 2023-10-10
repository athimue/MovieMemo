part of 'popular_series_cubit.dart';

abstract class PopularSeriesState extends Equatable {
  final List<Serie> series;
  final Error? error;

  const PopularSeriesState({
    this.series = const [],
    this.error,
  });

  @override
  List<Object?> get props => [series, error];
}

class PopularSeriesInitial extends PopularSeriesState {
  const PopularSeriesInitial();
}

class PopularSeriesLoading extends PopularSeriesState {
  const PopularSeriesLoading();
}

class PopularSeriesSuccess extends PopularSeriesState {
  const PopularSeriesSuccess({super.series});
}

class PopularSeriesFailed extends PopularSeriesState {
  const PopularSeriesFailed({super.error});
}
