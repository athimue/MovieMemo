part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  final List<SearchResult> searchResults;
  final Error? error;

  const SearchState({
    this.searchResults = const [],
    this.error,
  });

  @override
  List<Object?> get props => [searchResults, error];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchSuccess extends SearchState {
  const SearchSuccess({super.searchResults});
}

class SearchFailed extends SearchState {
  const SearchFailed({super.error});
}
