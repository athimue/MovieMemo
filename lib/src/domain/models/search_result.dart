class SearchResult {
  final int id;
  final String name;
  final String date;
  final String originalLanguage;
  final double popularity;
  final String overview;
  final String picturePath;
  final String mediaType;
  SearchResult(
      {required this.id,
      required this.name,
      required this.date,
      required this.originalLanguage,
      required this.popularity,
      required this.overview,
      required this.picturePath,
      required this.mediaType});
}
