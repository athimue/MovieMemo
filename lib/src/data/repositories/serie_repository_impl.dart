import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class SerieRepositoryImpl implements SerieRepository {
  final TdmbApiService tdmbApiService;

  SerieRepositoryImpl(this.tdmbApiService);

  @override
  Future<List<Serie>> getPopularSeries() async {
    try {
      final httpResponse = await tdmbApiService
          .getPopularSeries("9ee736e148e808222f04c1535dc80b64");
      if (httpResponse.results.isNotEmpty) {
        final response = httpResponse.results;
        final List<Serie> result =
            response.map((serieDto) => serieDto.parseSerieDto()).toList();
        return result;
      }
      return List.empty();
    } catch (e) {
      throw Error();
    }
  }
}
