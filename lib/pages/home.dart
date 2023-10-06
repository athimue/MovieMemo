import 'package:flutter/material.dart';
import 'package:movie_memo/pages/movie.dart';
import 'package:movie_memo/pages/profil.dart';
import 'package:movie_memo/pages/search.dart';
import 'package:movie_memo/pages/serie.dart';

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

  final _pages = <Widget>[Movie(), Serie(), Search(), Profil()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Icons.man,
                  color: Colors.orange,
                ),
                label: "Search")
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        body: _pages.elementAt(_selectedIndex));
  }
}
