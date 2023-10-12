import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class AddUnwatchedSerieUseCase {
  final SerieRepository serieRepository;

  AddUnwatchedSerieUseCase(this.serieRepository);

  Future<void> invoke(int serieId) {
    return serieRepository.addUnwatchedSeriee(serieId);
  }
}
