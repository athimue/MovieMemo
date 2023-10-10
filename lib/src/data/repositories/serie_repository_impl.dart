import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/domain/models/serie.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';

class SerieRepositoryImpl implements SerieRepository {
  final TdmbApiService tdmbApiService;

  SerieRepositoryImpl(this.tdmbApiService);

  @override
  Future<List<Serie>> getSeries() async {
    try {
      print("coucou");
      final httpResponse =
          await tdmbApiService.getSeries("9ee736e148e808222f04c1535dc80b64");
      print("connard");
      if (httpResponse.results.isNotEmpty) {
        print("connard");
        final response = httpResponse.results;
        final List<Serie> result =
            response.map((serieDto) => serieDto.parseSerieDto()).toList();
        return result;
      }
      print("connard");
      return List.empty();
    } catch (e) {
      print("tamere");
      print(e);
      throw Error();
    }
  }
}
