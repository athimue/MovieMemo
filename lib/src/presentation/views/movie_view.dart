import 'package:flutter/material.dart';
import 'package:movie_memo/src/presentation/widgets/movies/popular_movies.dart';
import 'package:movie_memo/src/presentation/widgets/movies/unwatched_movies.dart';
import 'package:movie_memo/src/presentation/widgets/movies/watched_movies.dart';

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
                WatchedMovies(),
                UnwatchedMovies()
              ],
            ))));
  }
}
