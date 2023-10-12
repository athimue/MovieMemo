import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class DeleteWatchedSerieUseCase {
  final SerieRepository serieRepository;

  DeleteWatchedSerieUseCase(this.serieRepository);

  Future<void> invoke(int serieId) {
    return serieRepository.deleteWatchedSerie(serieId);
  }
}
