import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/presentation/cubits/watched_series/watched_series_cubit.dart';

class WatchedSeries extends StatefulWidget {
  const WatchedSeries({Key? key}) : super(key: key);

  @override
  State<WatchedSeries> createState() => WatchedSeriesWidgetState();
}

class WatchedSeriesWidgetState extends State<WatchedSeries> {
  late WatchedSeriesCubit watchedSeriesCubit;

  @override
  void initState() {
    watchedSeriesCubit = BlocProvider.of<WatchedSeriesCubit>(context);
    watchedSeriesCubit.getWatchedSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchedSeriesCubit, WatchedSeriesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case WatchedSeriesInitial:
            return const Center(child: CircularProgressIndicator());
          case WatchedSeriesFailed:
            return const Center(child: Icon(Icons.error));
          case WatchedSeriesSuccess:
            return state.watchSeries.isEmpty
                ? Center(child: Text("No watched series."))
                : ListView.builder(
                    itemCount: state.watchSeries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            state.watchSeries[index].picturePath != ""
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                        state.watchSeries[index].picturePath))
                                : Text("No image"),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(children: [
                                      Text(
                                        state.watchSeries[index].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: Colors.pink),
                                      ),
                                      Text(
                                        "S${state.watchSeries[index].numberOfSeasons} - E${state.watchSeries[index].numberOfEpisodes}",
                                        style: TextStyle(color: Colors.pink),
                                      ),
                                      Text(
                                        "Platform : ${state.watchSeries[index].networks.first}",
                                        style: TextStyle(color: Colors.pink),
                                      ),
                                      Text(
                                          'Note : ${state.watchSeries[index].note.toString()} / 10',
                                          style: TextStyle(color: Colors.pink)),
                                    ]))),
                            ElevatedButton(
                                onPressed: () => {
                                      watchedSeriesCubit.deleteWatchedSerie(
                                          state.watchSeries[index].id)
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
