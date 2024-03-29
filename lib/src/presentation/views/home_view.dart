import 'package:flutter/material.dart';
import 'package:movie_memo/src/presentation/views/movie_view.dart';
import 'package:movie_memo/src/presentation/views/profil_view.dart';
import 'package:movie_memo/src/presentation/views/search_view.dart';
import 'package:movie_memo/src/presentation/views/serie_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = <Widget>[Serie(), Movie(), SearchResult(), Profil()];
  final _colors = <MaterialColor>[
    Colors.pink,
    Colors.green,
    Colors.blue,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.purple[100],
            title: Text(
              "MOVIE MEMO",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.purple[800]),
            )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie,
                  color: Colors.pink,
                ),
                label: "Series"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie_creation_rounded,
                  color: Colors.green,
                ),
                label: "Movies"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.auto_graph,
                  color: Colors.orange,
                ),
                label: "Profil")
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: _colors[_selectedIndex],
          unselectedItemColor: Colors.purple[300],
          onTap: _onItemTapped,
        ),
        body: _pages.elementAt(_selectedIndex));
  }
}
