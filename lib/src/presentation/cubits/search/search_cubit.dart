import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/search_result.dart';
import 'package:movie_memo/src/domain/usecases/add_unwatched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/add_unwatched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/add_watched_movie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/add_watched_serie_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_search_use_case.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
      {required this.getSearchUseCase,
      required this.addUnwatchedMovieUseCase,
      required this.addUnwatchedSerieUseCase,
      required this.addWatchedMovieUseCase,
      required this.addWatchedSerieUseCase})
      : super(SearchInitial()) {
    getSearchResult("");
  }

  final GetSearchUseCase getSearchUseCase;
  final AddUnwatchedMovieUseCase addUnwatchedMovieUseCase;
  final AddUnwatchedSerieUseCase addUnwatchedSerieUseCase;
  final AddWatchedMovieUseCase addWatchedMovieUseCase;
  final AddWatchedSerieUseCase addWatchedSerieUseCase;

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

  void unwatch(int id, String mediaType) {
    switch (mediaType) {
      case "movie":
        addUnwatchedMovieUseCase.invoke(id);
        break;
      case "tv":
        addUnwatchedSerieUseCase.invoke(id);
        break;
      default:
    }
  }

  void watch(int id, String mediaType) async {
    switch (mediaType) {
      case "movie":
        addWatchedMovieUseCase.invoke(id);
        break;
      case "tv":
        addWatchedSerieUseCase.invoke(id);
        break;
      default:
    }
  }
}
