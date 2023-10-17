part of 'profil_cubit.dart';

sealed class ProfilState extends Equatable {
  final List<Movie> unwatchedMovies;
  final List<Movie> watchedMovies;
  final List<Serie> unwatchedSeries;
  final List<Serie> watchedSeries;
  final Error? error;

  const ProfilState({
    this.unwatchedMovies = const [],
    this.watchedMovies = const [],
    this.unwatchedSeries = const [],
    this.watchedSeries = const [],
    this.error,
  });

  @override
  List<Object> get props => [];
}

class ProfilInitial extends ProfilState {
  const ProfilInitial();
}

class ProfilLoading extends ProfilState {
  const ProfilLoading();
}

class ProfilSuccess extends ProfilState {
  const ProfilSuccess(
      {super.unwatchedMovies,
      super.watchedMovies,
      super.unwatchedSeries,
      super.watchedSeries});
}

class ProfilFailed extends ProfilState {
  const ProfilFailed({super.error});
}
