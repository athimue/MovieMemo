// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:movie_memo/src/data/datasources/local/database_constants.dart';

@Entity(tableName: seriesTableName)
class SerieEntity extends Equatable {
  @PrimaryKey()
  final int id;
  final bool isWatched;
  SerieEntity({
    required this.id,
    required this.isWatched,
  });

  SerieEntity copyWith({
    int? id,
    bool? isWatched,
  }) {
    return SerieEntity(
      id: id ?? this.id,
      isWatched: isWatched ?? this.isWatched,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isWatched': isWatched,
    };
  }

  factory SerieEntity.fromMap(Map<String, dynamic> map) {
    return SerieEntity(
      id: map['id'] as int,
      isWatched: map['isWatched'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SerieEntity.fromJson(String source) =>
      SerieEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, isWatched];
}
