import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/album.dart';
import '../repositories/album_repository.dart';
part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitialState()) {
    on<AlbumEvent>((event, emit) async {
      emit.call(AlbumLoadingState());
      try {
        AlbumRepository repository = AlbumRepository();
        List<Album> albumList = await repository.getAlbums();
        emit.call(AlbumLoadedState(albumList));
      } catch (error) {
        emit.call(AlbumErrorState('Something went wrong!'));
      }
    });
  }
}
