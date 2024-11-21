import 'package:json_annotation/json_annotation.dart';

part 'transfert.g.dart';

@JsonSerializable()
class Artiste {
  Artiste();

  int id = 0;
  String titre = '';

  factory Artiste.fromJson(Map<String, dynamic> json) => _$ArtisteFromJson(json);

  Map<String, dynamic> toJson() => _$ArtisteToJson(this);
}
