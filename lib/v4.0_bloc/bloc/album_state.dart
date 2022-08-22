part of 'album_bloc.dart';

abstract class AlbumState {}

class AlbumInitialState extends AlbumState {}

class AlbumLoadingState extends AlbumState {}

class AlbumLoadedState extends AlbumState {
  final List<Album> albumList;
  AlbumLoadedState(this.albumList);
}

class AlbumErrorState extends AlbumState {
  final String errorMessage;
  AlbumErrorState(this.errorMessage);
}
