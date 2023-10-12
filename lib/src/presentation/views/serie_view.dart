import 'package:flutter/material.dart';
import 'package:movie_memo/src/presentation/widgets/popular_series.dart';
import 'package:movie_memo/src/presentation/widgets/unwatched_series.dart';
import 'package:movie_memo/src/presentation/widgets/watched_series.dart';

class Serie extends StatefulWidget {
  const Serie({super.key});

  @override
  SerieState createState() => SerieState();
}

class SerieState extends State<Serie> {
  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
        length: 3,
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.purple[100],
              toolbarHeight: 0,
              bottom: const TabBar(padding: EdgeInsets.all(0), tabs: [
                Tab(
                  icon: Icon(Icons.trending_up_outlined),
                  text: "Popular",
                ),
                Tab(
                  icon: Icon(
                    Icons.done,
                  ),
                  text: "Watched",
                ),
                Tab(
                  icon: Icon(Icons.watch_later),
                  text: "To See",
                )
              ]),
            ),
            body: TabBarView(
              children: <Widget>[
                PopularSeries(),
                WatchedSeries(),
                UnwatchedSeries()
              ],
            ))));
  }
}
