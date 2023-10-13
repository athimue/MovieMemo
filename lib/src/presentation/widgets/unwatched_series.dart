import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/presentation/cubits/unwatched_series/unwatched_series_cubit.dart';

class UnwatchedSeries extends StatefulWidget {
  const UnwatchedSeries({Key? key}) : super(key: key);

  @override
  State<UnwatchedSeries> createState() => UnwatchedSeriesWidgetState();
}

class UnwatchedSeriesWidgetState extends State<UnwatchedSeries> {
  late UnwatchedSeriesCubit unwatchedSeriesCubit;

  @override
  void initState() {
    unwatchedSeriesCubit = BlocProvider.of<UnwatchedSeriesCubit>(context);
    unwatchedSeriesCubit.getUnwatchedSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnwatchedSeriesCubit, UnwatchedSeriesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case UnwatchedSeriesLoading:
            return const Center(child: CircularProgressIndicator());
          case UnwatchedSeriesFailed:
            return const Center(child: Icon(Icons.error));
          case UnwatchedSeriesSuccess:
            return state.unwatchedSeries.isEmpty
                ? Center(child: Text("No unwatched series."))
                : ListView.builder(
                    itemCount: state.unwatchedSeries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(state
                                      .unwatchedSeries[index].picturePath)),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(children: [
                                        Text(
                                          state.unwatchedSeries[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Colors.pink),
                                        ),
                                        Text(
                                          "S${state.unwatchedSeries[index].numberOfSeasons} - E${state.unwatchedSeries[index].numberOfEpisodes}",
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                        Text(
                                          "Platform : ${state.unwatchedSeries[index].networks.first}",
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                        Text(
                                            'Note : ${state.unwatchedSeries[index].note.toString()} / 10',
                                            style:
                                                TextStyle(color: Colors.pink)),
                                      ]))),
                              Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () => {
                                            unwatchedSeriesCubit.watchSerie(
                                                state.unwatchedSeries[index].id)
                                          },
                                      child: Icon(Icons.done)),
                                  ElevatedButton(
                                      onPressed: () => {
                                            unwatchedSeriesCubit
                                                .deleteUnwatchedSerie(state
                                                    .unwatchedSeries[index].id)
                                          },
                                      child: Icon(Icons.delete))
                                ],
                              )
                            ])),
                        Divider(),
                      ]);
                    });
          default:
            return const Center(child: Icon(Icons.access_alarm));
        }
      },
    );
  }
}
