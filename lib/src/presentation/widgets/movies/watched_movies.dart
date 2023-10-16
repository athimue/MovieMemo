import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/presentation/cubits/watched_movies/watched_cubit.dart';

class WatchedMovies extends StatefulWidget {
  const WatchedMovies({Key? key}) : super(key: key);

  @override
  State<WatchedMovies> createState() => WatchedMoviesWidgetState();
}

class WatchedMoviesWidgetState extends State<WatchedMovies> {
  late WatchedCubit watchedMoviesCubit;

  @override
  void initState() {
    watchedMoviesCubit = BlocProvider.of<WatchedCubit>(context);
    watchedMoviesCubit.getWatchedMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchedCubit, WatchedMoviesState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case WatchedMoviesLoading:
            return const Center(child: CircularProgressIndicator());
          case WatchedMoviesFailed:
            return const Center(child: Icon(Icons.error));
          case WatchedMoviesSuccess:
            return state.watchMovies.isEmpty
                ? Center(child: Text("No watched movies."))
                : ListView.builder(
                    itemCount: state.watchMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                    state.watchMovies[index].picturePath)),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(children: [
                                      Text(
                                        state.watchMovies[index].title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: Colors.green),
                                      ),
                                      Text(
                                        "Platform : ${state.watchMovies[index].releaseDate}",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Text(
                                          'Note : ${state.watchMovies[index].note.toString()} / 10',
                                          style:
                                              TextStyle(color: Colors.green)),
                                    ]))),
                            ElevatedButton(
                                onPressed: () => {
                                      watchedMoviesCubit.deleteWatchedMovie(
                                          state.watchMovies[index].id)
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
