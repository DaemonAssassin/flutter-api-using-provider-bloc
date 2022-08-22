import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/album_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AlbumBloc, AlbumState>(
          builder: (context, state) {
            if (state is AlbumInitialState) {
              return _buildInitialUI();
            } else if (state is AlbumLoadingState) {
              return _buildLoadingUI();
            } else if (state is AlbumLoadedState) {
              return _buildLoadedUI(state);
            } else if (state is AlbumErrorState) {
              return _buildErrorUI(state.errorMessage);
            } else {
              return _buildErrorUI('Nothing found.!!!');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AlbumBloc>().add(FetchAlbumsEvent());
        },
      ),
    );
  }

  Widget _buildInitialUI() {
    return const Text('Fetch Data by Floating Action Button');
  }

  Widget _buildLoadingUI() {
    return const CircularProgressIndicator();
  }

  Widget _buildErrorUI(String message) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }

  Widget _buildLoadedUI(AlbumLoadedState state) {
    return ListView.builder(
      itemCount: state.albumList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            state.albumList[index].id.toString(),
            style: const TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
          ),
        );
      },
    );
  }
}


// builder: (context, state) {
//             if (state.albumList == null) {
//               return const CircularProgressIndicator();
//             } else {
//               return ListView.builder(
//                 itemCount: state.albumList?.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       state.albumList![index].id.toString(),
//                       style: const TextStyle(
//                         fontSize: 48.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.yellow,
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         )