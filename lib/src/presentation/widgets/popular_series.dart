import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_memo/src/presentation/cubits/popular_series/popular_series_cubit.dart';

class PopularSeries extends HookWidget {
  PopularSeries({super.key});

  @override
  Widget build(BuildContext context) {
    final popularSeriesCubit = BlocProvider.of<PopularSeriesCubit>(context);
    return BlocBuilder<PopularSeriesCubit, PopularSeriesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case PopularSeriesLoading:
            return const Center(child: CircularProgressIndicator());
          case PopularSeriesFailed:
            return const Center(child: Icon(Icons.error));
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
                                                      .addUnwatchedSerie(state
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
