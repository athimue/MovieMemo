import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/presentation/cubits/unwatched_movies/unwatched_movies_cubit.dart';

class UnwatchedMovies extends StatefulWidget {
  const UnwatchedMovies({Key? key}) : super(key: key);

  @override
  State<UnwatchedMovies> createState() => UnwatchedMoviesWidgetState();
}

class UnwatchedMoviesWidgetState extends State<UnwatchedMovies> {
  late UnwatchedMoviesCubit unwatchedMoviesCubit;

  @override
  void initState() {
    unwatchedMoviesCubit = BlocProvider.of<UnwatchedMoviesCubit>(context);
    unwatchedMoviesCubit.getUnwatchedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnwatchedMoviesCubit, UnwatchedMoviesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case UnwatchedMoviesLoading:
            return const Center(child: CircularProgressIndicator());
          case UnwatchedMoviesFailed:
            return const Center(child: Icon(Icons.error));
          case UnwatchedMoviesSuccess:
            return state.unwatchedMovies.isEmpty
                ? Center(child: Text("No unwatched movies."))
                : ListView.builder(
                    itemCount: state.unwatchedMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(children: [
                              state.unwatchedMovies[index].picturePath != ""
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(state
                                          .unwatchedMovies[index].picturePath))
                                  : Text("No image"),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(children: [
                                        Text(
                                          state.unwatchedMovies[index].title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Colors.green),
                                        ),
                                        Text(
                                          "Release date : ${state.unwatchedMovies[index].releaseDate}",
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        Text(
                                            'Note : ${state.unwatchedMovies[index].note.toString()} / 10',
                                            style:
                                                TextStyle(color: Colors.green)),
                                      ]))),
                              Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () => {
                                            unwatchedMoviesCubit.watchMovie(
                                                state.unwatchedMovies[index].id)
                                          },
                                      child: Icon(Icons.done)),
                                  ElevatedButton(
                                      onPressed: () => {
                                            unwatchedMoviesCubit
                                                .deleteUnwatchedMovie(state
                                                    .unwatchedMovies[index].id)
                                          },
                                      child: Icon(Icons.delete))
                                ],
                              )
                            ])),
                        Divider(),
                      ]);
                    });
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
