part of 'unwatched_series_cubit.dart';

abstract class UnwatchedSeriesState extends Equatable {
  final List<Serie> unwatchedSeries;
  final Error? error;

  const UnwatchedSeriesState({
    this.unwatchedSeries = const [],
    this.error,
  });

  @override
  List<Object?> get props => [unwatchedSeries, error];
}

class UnwatchedSeriesInitial extends UnwatchedSeriesState {
  const UnwatchedSeriesInitial();
}

class UnwatchedSeriesLoading extends UnwatchedSeriesState {
  const UnwatchedSeriesLoading();
}

class UnwatchedSeriesSuccess extends UnwatchedSeriesState {
  const UnwatchedSeriesSuccess({super.unwatchedSeries});
}

class UnwatchedSeriesFailed extends UnwatchedSeriesState {
  const UnwatchedSeriesFailed({super.error});
}
