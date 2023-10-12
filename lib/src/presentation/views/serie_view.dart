import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_memo/src/presentation/cubits/popular_series/popular_series_cubit.dart';
import 'package:movie_memo/src/presentation/cubits/watched_series/watched_series_cubit.dart';

class Serie extends HookWidget {
  Serie({super.key});

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
                Icon(Icons.watch_later)
              ],
            ))));
  }
}

class PopularSeries extends HookWidget {
  PopularSeries({super.key});

  @override
  Widget build(BuildContext context) {
    final popularSeriesCubit = BlocProvider.of<PopularSeriesCubit>(context);
    return BlocBuilder<PopularSeriesCubit, PopularSeriesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case PopularSeriesLoading:
            return const Center(child: Icon(Icons.baby_changing_station_sharp));
          case PopularSeriesFailed:
            return const Center(child: Icon(Icons.refresh));
          case PopularSeriesSuccess:
            return state.popularSeries.isEmpty
                ? Center(child: Text("No popular series."))
                : Column(children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: state.popularSeries.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(state
                                            .popularSeries[index].picturePath)),
                                    Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(children: [
                                              Text(
                                                state.popularSeries[index].name,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                    color: Colors.pink),
                                              ),
                                              Text(
                                                state.popularSeries[index].date,
                                                style: TextStyle(
                                                    color: Colors.pink),
                                              ),
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                      "https://flagsapi.com/${state.popularSeries[index].country}/flat/32.png")),
                                              Text(
                                                  'Note : ${state.popularSeries[index].note.toString()} / 10',
                                                  style: TextStyle(
                                                      color: Colors.pink)),
                                            ]))),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () => {
                                                  popularSeriesCubit
                                                      .addWatchedSerie(state
                                                          .popularSeries[index]
                                                          .id)
                                                },
                                            child: Icon(Icons.done)),
                                        ElevatedButton(
                                            onPressed: () => {
                                                  popularSeriesCubit
                                                      .addWatchedSerie(state
                                                          .popularSeries[index]
                                                          .id)
                                                },
                                            child: Icon(Icons.watch_later))
                                      ],
                                    )
                                  ]),
                                ),
                                Divider(color: Colors.pink)
                              ]);
                            }))
                  ]);
          default:
            return const Center(child: Icon(Icons.access_alarm));
        }
      },
    );
  }
}

class WatchedSeries extends HookWidget {
  WatchedSeries({super.key});

  @override
  Widget build(BuildContext context) {
    final watchedSeriesCubit = BlocProvider.of<WatchedSeriesCubit>(context);
    return BlocBuilder<WatchedSeriesCubit, WatchedSeriesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case WatchedSeriesLoading:
            return const Center(child: Icon(Icons.baby_changing_station_sharp));
          case WatchedSeriesFailed:
            return const Center(child: Icon(Icons.refresh));
          case WatchedSeriesSuccess:
            return state.series.isEmpty
                ? Center(child: Text("No watched series."))
                : ListView.builder(
                    itemCount: state.series.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                    state.series[index].picturePath)),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(children: [
                                      Text(
                                        state.series[index].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: Colors.pink),
                                      ),
                                      Text(
                                        "S${state.series[index].numberOfSeasons} - E${state.series[index].numberOfEpisodes}",
                                        style: TextStyle(color: Colors.pink),
                                      ),
                                      Text(
                                        "Platform : ${state.series[index].networks.first}",
                                        style: TextStyle(color: Colors.pink),
                                      ),
                                      Text(
                                          'Note : ${state.series[index].note.toString()} / 10',
                                          style: TextStyle(color: Colors.pink)),
                                    ]))),
                            ElevatedButton(
                                onPressed: () => {
                                      watchedSeriesCubit.deleteWatchedSerie(
                                          state.series[index].id)
                                    },
                                child: Icon(Icons.delete))
                          ]),
                        ),
                        Divider()
                      ]);
                    });
          default:
            return const Center(child: Icon(Icons.access_alarm));
        }
      },
    );
  }
}
