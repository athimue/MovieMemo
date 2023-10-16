import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_memo/src/presentation/cubits/search/search_cubit.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  SearchResultState createState() => SearchResultState();
}

class SearchResultState extends State<SearchResult> {
  late SearchCubit searchCubit;

  @override
  void initState() {
    searchCubit = BlocProvider.of<SearchCubit>(context);
    searchCubit.getSearchResult("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            onSubmitted: (value) {
              searchCubit.getSearchResult(value);
            },
            decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Expanded(
            child: (() {
          switch (state.runtimeType) {
            case SearchLoading:
              return const Center(
                  child: Icon(Icons.baby_changing_station_sharp));
            case SearchFailed:
              return const Center(child: Icon(Icons.refresh));
            case SearchSuccess:
              return state.searchResults.isEmpty
                  ? Center(child: Text("No result."))
                  : ListView.builder(
                      itemCount: state.searchResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            padding: EdgeInsets.all(10),
                            child: Row(children: [
                              state.searchResults[index].picturePath != ""
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(state
                                          .searchResults[index].picturePath),
                                    )
                                  : Text("No image"),
                              Expanded(
                                  child: Column(children: [
                                Text(
                                  state.searchResults[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.blue),
                                ),
                                Text(
                                  state.searchResults[index].date,
                                  style: TextStyle(color: Colors.blue),
                                ),
                                Text(
                                  state.searchResults[index].originalLanguage
                                      .toUpperCase(),
                                  style: TextStyle(color: Colors.blue),
                                ),
                                Text(
                                  state.searchResults[index].mediaType,
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ])),
                              Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () => {
                                            searchCubit.watch(
                                                state.searchResults[index].id,
                                                state.searchResults[index]
                                                    .mediaType)
                                          },
                                      child: Icon(Icons.done)),
                                  ElevatedButton(
                                      onPressed: () => {
                                            searchCubit.unwatch(
                                                state.searchResults[index].id,
                                                state.searchResults[index]
                                                    .mediaType)
                                          },
                                      child: Icon(Icons.delete))
                                ],
                              )
                            ]));
                      });
            default:
              return const Center(
                  child: Icon(Icons.baby_changing_station_sharp));
          }
        }()))
      ]);
    });
  }
}
