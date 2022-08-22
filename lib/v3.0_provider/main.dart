import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repositories/album_repository.dart';
import 'screens/home_screen.dart';

void main(List<String> args) {
  runApp(const MyAppWidget());
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider(
        create: (context) => AlbumRepository(),
        child: const HomeScreen(),
      ),
    );
  }
}
