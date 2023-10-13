import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/search_result.dart';
import 'package:movie_memo/src/domain/usecases/get_search_use_case.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.getSearchUseCase}) : super(SearchInitial()) {
    getSearchResult("");
  }

  final GetSearchUseCase getSearchUseCase;

  void getSearchResult(String query) async {
    try {
      emit(SearchLoading());
      final searchResults = await getSearchUseCase.invoke(query);
      emit(SearchSuccess(searchResults: searchResults));
    } catch (e) {
      print(e);
      emit(SearchFailed());
    }
  }
}
