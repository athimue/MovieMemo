class PopularMovie {
  final int id;
  final String name;
  final String date;
  final String originalLanguage;
  final double voteAverage;
  final String overview;
  final String picturePath;
  PopularMovie(
      {required this.id,
      required this.name,
      required this.date,
      required this.originalLanguage,
      required this.voteAverage,
      required this.overview,
      required this.picturePath});
}
