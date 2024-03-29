class Serie {
  final int id;
  final String name;
  final String date;
  final List<String> author;
  final String country;
  final List<String> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final double note;
  final String picturePath;

  Serie(
      {required this.id,
      required this.name,
      required this.date,
      required this.author,
      required this.country,
      required this.networks,
      required this.numberOfEpisodes,
      required this.numberOfSeasons,
      required this.note,
      required this.picturePath});
}
