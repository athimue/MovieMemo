import 'package:movie_memo/src/domain/models/search_result.dart';

abstract class SearchRepository {
  Future<List<SearchResult>> getSearch(String query);
}
