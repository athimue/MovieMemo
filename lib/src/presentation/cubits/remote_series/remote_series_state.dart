part of 'remote_series_cubit.dart';

abstract class RemoteSeriesState extends Equatable {
  final List<Serie> series;
  final Error? error;

  const RemoteSeriesState({
    this.series = const [],
    this.error,
  });

  @override
  List<Object?> get props => [series, error];
}

class RemoteSeriesInitial extends RemoteSeriesState {
  const RemoteSeriesInitial();
}

class RemoteSeriesLoading extends RemoteSeriesState {
  const RemoteSeriesLoading();
}

class RemoteSeriesSuccess extends RemoteSeriesState {
  const RemoteSeriesSuccess({super.series});
}

class RemoteSeriesFailed extends RemoteSeriesState {
  const RemoteSeriesFailed({super.error});
}
