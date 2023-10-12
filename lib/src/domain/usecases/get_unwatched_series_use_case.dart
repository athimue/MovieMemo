import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class GetUnwatchedSeriesUseCase {
  final SerieRepository serieRepository;

  GetUnwatchedSeriesUseCase(this.serieRepository);

  Future<List<Serie>> invoke() {
    return serieRepository.getUnwatchedSeries();
  }
}
