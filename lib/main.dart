import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/usecases/get_Watched_series_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movie_memo/src/domain/usecases/get_popular_series_use_case.dart';
import 'package:movie_memo/src/locator.dart';
import 'package:movie_memo/src/presentation/cubits/popular_movies/popular_movies_cubit.dart';
import 'package:movie_memo/src/presentation/cubits/popular_series/popular_series_cubit.dart';
import 'package:movie_memo/src/presentation/cubits/watched_series/watched_series_cubit.dart';
import 'package:movie_memo/src/presentation/views/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PopularSeriesCubit>(
            create: (context) => PopularSeriesCubit(
              getPopularSeriesUseCase: locator<GetPopularSeriesUseCase>(),
            ),
          ),
          BlocProvider<PopularMoviesCubit>(
            create: (context) => PopularMoviesCubit(
              getPopularMoviesUseCase: locator<GetPopularMoviesUseCase>(),
            ),
          ),
          BlocProvider<WatchedSeriesCubit>(
            create: (context) => WatchedSeriesCubit(
              getWatchedSeriesUseCase: locator<GetWatchedSeriesUseCase>(),
            ),
          )
        ],
        child: MaterialApp(
          title: 'Movie Memo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(),
        ));
  }
}
