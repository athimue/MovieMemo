import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/models/movie.dart';

import '../../../domain/usecases/get_popular_movies_use_case.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit({required this.getPopularMoviesUseCase})
      : super(PopularMoviesInitial()) {
    getRemoteMovies();
  }

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  void getRemoteMovies() async {
    try {
      emit(PopularMoviesLoading());
      final series = await getPopularMoviesUseCase.invoke();
      emit(PopularMoviesSuccess(movies: series));
    } catch (e) {
      emit(PopularMoviesFailed());
    }
  }
}
