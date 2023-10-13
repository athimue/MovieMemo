import 'package:movie_memo/src/domain/models/search_result.dart';
import 'package:movie_memo/src/domain/repositories/search_repository.dart';

class GetSearchUseCase {
  final SearchRepository searchRepository;

  GetSearchUseCase(this.searchRepository);

  Future<List<SearchResult>> invoke(String query) {
    return searchRepository.getSearch(query);
  }
}
