import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class DeleteUnwatchedSerieUseCase {
  final SerieRepository serieRepository;

  DeleteUnwatchedSerieUseCase(this.serieRepository);

  Future<void> invoke(int serieId) {
    return serieRepository.deleteUnwatchedSerie(serieId);
  }
}
