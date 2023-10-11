import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

import '../models/serie.dart';

class GetPopularSeriesUseCase {
  final SerieRepository serieRepository;
  GetPopularSeriesUseCase(this.serieRepository);
  Future<List<Serie>> invoke() {
    return serieRepository.getPopularSeries();
  }
}
