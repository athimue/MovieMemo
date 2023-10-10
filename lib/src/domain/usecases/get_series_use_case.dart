import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

import '../models/serie.dart';

class GetSeriesUseCase {
  final SerieRepository serieRepository;
  GetSeriesUseCase(this.serieRepository);
  Future<List<Serie>> execute() {
    return serieRepository.getSeries();
  }
}
