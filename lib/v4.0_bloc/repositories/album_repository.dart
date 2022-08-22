import '../models/album.dart';
import '../services/get/album_api_service.dart';

class AlbumRepository {
  final AlbumApiService _albumApiService = AlbumApiService();
  Future<List<Album>> getAlbums() async {
    return await _albumApiService.fetchAlbums();
  }
}
