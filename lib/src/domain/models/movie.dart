class Movie {
  final int id;
  final String title;
  final String releaseDate;
  final double note;
  final int runtime;
  final String picturePath;

  Movie(
      {required this.id,
      required this.title,
      required this.releaseDate,
      required this.note,
      required this.runtime,
      required this.picturePath});
}
