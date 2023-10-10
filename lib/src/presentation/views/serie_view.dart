import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_memo/src/presentation/cubits/remote_series/remote_series_cubit.dart';

class Serie extends HookWidget {
  Serie({super.key});

  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(tabs: [
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
              children: <Widget>[Icon(Icons.abc_rounded), SeriesToSee()],
            ))));
  }
}

class SeriesToSee extends HookWidget {
  SeriesToSee({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteSeriesCubit, RemoteSeriesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case RemoteSeriesLoading:
            return const Center(child: Icon(Icons.baby_changing_station_sharp));
          case RemoteSeriesFailed:
            return const Center(child: Icon(Icons.refresh));
          case RemoteSeriesSuccess:
            return state.series.isEmpty
                ? Text("vide")
                : ListView.builder(
                    itemCount: state.series.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        color: Colors.amber,
                        child: Center(
                            child: Text('SERIE : ${state.series[index].name}')),
                      );
                    });
          default:
            return const Center(child: Icon(Icons.access_alarm));
        }
      },
    );
  }
}
