import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/album_repository.dart';

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
        child: Consumer<AlbumRepository>(
          builder: (context, AlbumRepository albumRepository, child) {
            if (albumRepository.albumList == null) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: albumRepository.albumList?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      albumRepository.albumList![index].id.toString(),
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
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AlbumRepository>().getAlbums();
        },
      ),
    );
  }
}


// child: FutureBuilder<List<Album>>(
//           future: albumRepository.getAlbums(),
//           builder: (context, snapshot) {
//             bool hasWaitingOrNone =
//                 snapshot.connectionState == ConnectionState.waiting ||
//                     snapshot.connectionState == ConnectionState.none;
//             bool hasActiveOrDone =
//                 (snapshot.connectionState == ConnectionState.active ||
//                         snapshot.connectionState == ConnectionState.done) &&
//                     snapshot.hasData;
//             if (hasWaitingOrNone) {
//               return const CircularProgressIndicator();
//             } else if (hasActiveOrDone) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       snapshot.data![index].id.toString(),
//                       style: const TextStyle(
//                         fontSize: 48.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.yellow,
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return const Text(
//                 'Error Occurred',
//                 style: TextStyle(
//                   fontSize: 48.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red,
//                 ),
//               );
//             } else {
//               return const Text('No Data Found');
//             }
//           },
//         )