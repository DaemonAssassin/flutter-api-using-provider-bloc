import 'package:flutter/foundation.dart';

import '../models/album.dart';
import '../services/get/album_api_service.dart';

class AlbumRepository with ChangeNotifier {
  List<Album>? albumList;
  final AlbumApiService _albumApiService = AlbumApiService();
  Future<void> getAlbums() async {
    albumList = await _albumApiService.fetchAlbums();
    print(albumList);
    notifyListeners();
  }
}
