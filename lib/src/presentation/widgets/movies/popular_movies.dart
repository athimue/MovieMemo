import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/presentation/cubits/popular_movies/popular_movies_cubit.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  State<PopularMovies> createState() => PopularMoviesWidgetState();
}

class PopularMoviesWidgetState extends State<PopularMovies> {
  late PopularMoviesCubit popularMoviesCubit;

  @override
  void initState() {
    popularMoviesCubit = BlocProvider.of<PopularMoviesCubit>(context);
    popularMoviesCubit.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case PopularMoviesLoading:
            return const Center(child: CircularProgressIndicator());
          case PopularMoviesFailed:
            return const Center(child: Icon(Icons.error));
          case PopularMoviesSuccess:
            return state.popularMovies.isEmpty
                ? Center(child: Text("No popular movies."))
                : ListView.builder(
                    itemCount: state.popularMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                    state.popularMovies[index].picturePath)),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(children: [
                                      Text(
                                        state.popularMovies[index].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: Colors.green),
                                      ),
                                      Text(
                                        state.popularMovies[index].date,
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Text(
                                          state.popularMovies[index]
                                              .originalLanguage
                                              .toUpperCase(),
                                          style:
                                              TextStyle(color: Colors.green)),
                                      Text(
                                          "Note : ${state.popularMovies[index].voteAverage.toString()} / 10",
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ]))),
                            Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () => {
                                          popularMoviesCubit.addWatchedMovie(
                                              state.popularMovies[index].id)
                                        },
                                    child: Icon(Icons.done)),
                                ElevatedButton(
                                    onPressed: () => {
                                          popularMoviesCubit.addUnwatchedMovie(
                                              state.popularMovies[index].id)
                                        },
                                    child: Icon(Icons.watch_later))
                              ],
                            )
                          ]),
                        ),
                        Divider(color: Colors.green)
                      ]);
                    });
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
