import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/movie_list.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    var favoriteList = context.watch<MovieProvider>().getFavorites;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(
            // color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amber[400],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
          child: ListView.builder(
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              var currentMovie = favoriteList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Card(
                  elevation: 1,
                  color: Colors.amber[100],
                  shape: RoundedRectangleBorder(
                    // side: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    title: Text(currentMovie.name),
                    subtitle: Text(currentMovie.duration),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<MovieProvider>()
                              .deleteMovie(currentMovie);
                        },
                        icon: Icon(
                          Icons.delete_rounded,
                          color: Colors.amber[700],
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
