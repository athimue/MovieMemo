import 'package:movie_memo/src/domain/models/movie.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class GetWatchedSeriesUseCase {
  final SerieRepository serieRepository;

  GetWatchedSeriesUseCase(this.serieRepository);

  Future<List<Serie>> invoke() {
    return serieRepository.getWatchedSeries();
  }
}
