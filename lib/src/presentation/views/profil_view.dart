import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/presentation/cubits/profil/profil_cubit.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  ProfilWidgetState createState() => ProfilWidgetState();
}

class ProfilWidgetState extends State<Profil> {
  late ProfilCubit profilCubit;

  @override
  void initState() {
    profilCubit = BlocProvider.of<ProfilCubit>(context);
    profilCubit.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilCubit, ProfilState>(builder: (context, state) {
      switch (state.runtimeType) {
        case ProfilLoading:
          return const Center(child: CircularProgressIndicator());
        case ProfilFailed:
          return const Center(child: Icon(Icons.error));
        case ProfilSuccess:
          return Column(children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "MOVIES",
                          style: TextStyle(fontSize: 25),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Column(children: [
                                  Text("Movies watched",
                                      style: TextStyle(fontSize: 15)),
                                  Text(state.watchedMovies.length.toString())
                                ])),
                                Expanded(
                                    child: Column(children: [
                                  Text("Movies to see",
                                      style: TextStyle(fontSize: 15)),
                                  Text(state.unwatchedMovies.length.toString())
                                ])),
                                Expanded(
                                    child: Column(children: [
                                  Text("Movie time",
                                      style: TextStyle(fontSize: 15)),
                                  Text(
                                      "${state.watchedMovies.map((e) => e.runtime).reduce((value, element) => value + element).toString()} min")
                                ])),
                              ],
                            ))
                      ],
                    ))
                  ],
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "SERIES",
                          style: TextStyle(fontSize: 25),
                        ),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Column(children: [
                                  Text("Series watched",
                                      style: TextStyle(fontSize: 15)),
                                  Text(state.watchedSeries.length.toString())
                                ])),
                                Expanded(
                                    child: Column(children: [
                                  Text("Series to see",
                                      style: TextStyle(fontSize: 15)),
                                  Text(state.unwatchedSeries.length.toString())
                                ])),
                                Expanded(
                                    child: Column(children: [
                                  Text("TV time",
                                      style: TextStyle(fontSize: 15)),
                                  Text("? min")
                                ])),
                              ],
                            ))
                      ],
                    ))
                  ],
                ))
          ]);
        default:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
