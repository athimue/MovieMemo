import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_memo/src/presentation/cubits/popular_series/popular_series_cubit.dart';

class Serie extends HookWidget {
  Serie({super.key});

  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
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
                PopularSeries(),
                Icon(Icons.abc_rounded),
                Icon(Icons.remove_red_eye_sharp)
              ],
            ))));
  }
}

class PopularSeries extends HookWidget {
  PopularSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularSeriesCubit, PopularSeriesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case PopularSeriesLoading:
            return const Center(child: Icon(Icons.baby_changing_station_sharp));
          case PopularSeriesFailed:
            return const Center(child: Icon(Icons.refresh));
          case PopularSeriesSuccess:
            return state.series.isEmpty
                ? Center(child: Text("No popular series."))
                : ListView.builder(
                    itemCount: state.series.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                    state.series[index].picturePath)),
                            Expanded(
                                child: Column(children: [
                              Text(
                                state.series[index].name,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),,
                              ),
                              Text(
                                state.series[index].date,
                              ),
                              Text(
                                  'Langue : ${state.series[index].originalLanguage} / Pays : ${state.series[index].originCountry}'),
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
