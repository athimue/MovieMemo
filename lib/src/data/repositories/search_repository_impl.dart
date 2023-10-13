import 'package:movie_memo/src/data/datasources/remote/api/tdmb_api_service.dart';
import 'package:movie_memo/src/domain/models/search_result.dart';
import 'package:movie_memo/src/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final TdmbApiService tdmbApiService;

  SearchRepositoryImpl(this.tdmbApiService);

  @override
  Future<List<SearchResult>> getSearch(String query) async {
    try {
      final httpResponse = await tdmbApiService.getSearchResult(
          "9ee736e148e808222f04c1535dc80b64", query);
      if (httpResponse.results.isNotEmpty) {
        final List<SearchResult> result = httpResponse.results
            .map((movieDto) => movieDto.parsePopularMovieDto())
            .toList();
        return result;
      }
      return List.empty();
    } catch (e) {
      print(e);
      throw Error();
    }
  }
}
