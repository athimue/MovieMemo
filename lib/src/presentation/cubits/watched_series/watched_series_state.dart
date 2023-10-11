part of 'watched_series_cubit.dart';

abstract class WatchedSeriesState extends Equatable {
  final List<Serie> series;
  final Error? error;

  const WatchedSeriesState({
    this.series = const [],
    this.error,
  });

  @override
  List<Object?> get props => [series, error];
}

class WatchedSeriesInitial extends WatchedSeriesState {
  const WatchedSeriesInitial();
}

class WatchedSeriesLoading extends WatchedSeriesState {
  const WatchedSeriesLoading();
}

class WatchedSeriesSuccess extends WatchedSeriesState {
  const WatchedSeriesSuccess({super.series});
}

class WatchedSeriesFailed extends WatchedSeriesState {
  const WatchedSeriesFailed({super.error});
}
