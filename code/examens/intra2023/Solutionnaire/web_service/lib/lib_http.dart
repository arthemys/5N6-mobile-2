import 'package:dio/dio.dart';
import 'package:solutionnaire/transfert.dart';

Future<List<Artiste>> searchArtists(String terme) async {
  final dio = Dio();
  try {
    final response =
        await dio.get('https://examen-intra-a23.azurewebsites.net/exam/artiste/recherche/$terme');
    return (response.data as List).map((artiste) => Artiste.fromJson(artiste)).toList();
  } catch (e) {
    print(e);
    rethrow;
  }
}
