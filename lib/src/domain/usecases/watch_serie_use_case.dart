import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class WatchSerieUseCase {
  final SerieRepository serieRepository;

  WatchSerieUseCase(this.serieRepository);

  Future<void> invoke(int serieId) {
    return serieRepository.watchSerie(serieId);
  }
}
