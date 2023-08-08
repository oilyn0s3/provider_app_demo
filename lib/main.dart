import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/movie_list.dart';
import 'home.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    create: (context) => MovieProvider(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
