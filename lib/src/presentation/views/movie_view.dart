import 'package:flutter/material.dart';

class Movie extends StatelessWidget {
  Movie({super.key});

  @override
  Widget build(BuildContext context) {
    return (Center(
        child: Icon(
      Icons.movie_edit,
      size: 150,
    )));
  }
}
