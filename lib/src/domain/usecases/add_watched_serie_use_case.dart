import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class AddWatchedSerieUseCase {
  final SerieRepository serieRepository;

  AddWatchedSerieUseCase(this.serieRepository);

  Future<void> invoke(int serieId) {
    return serieRepository.addWatchedSerie(serieId);
  }
}
