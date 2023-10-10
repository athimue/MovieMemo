import 'package:movie_memo/src/domain/models/serie.dart';

abstract class SerieRepository {
  Future<List<Serie>> getSeries();
}
