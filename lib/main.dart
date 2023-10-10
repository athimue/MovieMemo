import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/domain/repositories/serie_repository.dart';
import 'package:movie_memo/src/locator.dart';
import 'package:movie_memo/src/presentation/cubits/remote_series/remote_series_cubit.dart';
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
          BlocProvider<RemoteSeriesCubit>(
            create: (context) => RemoteSeriesCubit(
              serieRepository: locator<SerieRepository>(),
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
