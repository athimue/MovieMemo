part of 'watched_series_cubit.dart';

abstract class WatchedSeriesState extends Equatable {
  final List<Serie> watchSeries;
  final Error? error;

  const WatchedSeriesState({
    this.watchSeries = const [],
    this.error,
  });

  @override
  List<Object?> get props => [watchSeries, error];
}

class WatchedSeriesInitial extends WatchedSeriesState {
  const WatchedSeriesInitial();
}

class WatchedSeriesLoading extends WatchedSeriesState {
  const WatchedSeriesLoading();
}

class WatchedSeriesSuccess extends WatchedSeriesState {
  const WatchedSeriesSuccess({super.watchSeries});
}

class WatchedSeriesFailed extends WatchedSeriesState {
  const WatchedSeriesFailed({super.error});
}
