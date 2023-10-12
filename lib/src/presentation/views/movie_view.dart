import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_memo/src/presentation/cubits/popular_movies/popular_movies_cubit.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  MovieState createState() => MovieState();
}

class MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple[100],
              toolbarHeight: 0,
              bottom: const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.trending_up_outlined),
                  text: "Popular",
                ),
                Tab(
                  icon: Icon(
                    Icons.done,
                  ),
                  text: "Saw",
                ),
                Tab(
                  icon: Icon(Icons.today_outlined),
                  text: "To See",
                )
              ]),
            ),
            body: TabBarView(
              children: <Widget>[
                PopularMovies(),
                Icon(Icons.abc_rounded),
                Icon(Icons.remove_red_eye_sharp)
              ],
            ))));
  }
}

class PopularMovies extends HookWidget {
  PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case PopularMoviesLoading:
            return const Center(child: Icon(Icons.baby_changing_station_sharp));
          case PopularMoviesFailed:
            return const Center(child: Icon(Icons.refresh));
          case PopularMoviesSuccess:
            return state.movies.isEmpty
                ? Center(child: Text("No popular movies."))
                : ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                    state.movies[index].picturePath)),
                            Expanded(
                                child: Column(children: [
                              Text(
                                state.movies[index].name,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.movies[index].date,
                                textAlign: TextAlign.center,
                              ),
                              Text(state.movies[index].originalLanguage,
                                  textAlign: TextAlign.center),
                              Text(state.movies[index].popularity.toString(),
                                  textAlign: TextAlign.center),
                            ]))
                          ]));
                    });
          default:
            return const Center(child: Icon(Icons.access_alarm));
        }
      },
    );
  }
}
