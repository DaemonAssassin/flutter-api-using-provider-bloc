// ignore_for_file: avoid_print

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../../models/album.dart';
import '../../utils/constants.dart';

class AlbumApiService {
  Future<List<Album>> fetchAlbums() async {
    http.Response response = await http.get(Uri.parse('$baseUrl$endPoint'));
    if (response.statusCode == 200) {
      List decodedList = convert.jsonDecode(response.body);
      return decodedList.map((element) => Album.fromMap(element)).toList();
    }

    throw 'No data found';
  }
}
