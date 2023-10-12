import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

import '../models/popular_serie.dart';

class GetPopularSeriesUseCase {
  final SerieRepository serieRepository;
  GetPopularSeriesUseCase(this.serieRepository);
  Future<List<PopularSerie>> invoke() {
    return serieRepository.getPopularSeries();
  }
}
