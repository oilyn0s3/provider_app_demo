import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_demo/components/movie_list.dart';
import 'package:provider_app_demo/fav_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var movieList = context.watch<MovieProvider>().getMovies;
    var favoriteList = context.watch<MovieProvider>().getFavorites;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavPage(),
                ),
              );
            },
            child: Badge(
              isLabelVisible: favoriteList.isNotEmpty,
              offset: const Offset(8, -5),
              backgroundColor: Colors.amber[900],
              alignment: Alignment.topRight,
              // isLabelVisible: false,
              label: Text("${favoriteList.length}"),
              child: const Icon(
                Icons.favorite_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: const Text(
          "Movie Provider",
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
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              var currentMovie = movieList[index];
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
                        if (!favoriteList.contains(currentMovie)) {
                          context.read<MovieProvider>().addMovie(currentMovie);
                        } else {
                          context
                              .read<MovieProvider>()
                              .deleteMovie(currentMovie);
                        }
                      },
                      icon: favoriteList.contains(currentMovie)
                          ? Icon(
                              Icons.favorite_rounded,
                              color: Colors.amber[700],
                            )
                          : const Icon(Icons.favorite_border_rounded),
                    ),
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


// shape: RoundedRectangleBorder(
//                   side: const BorderSide(color: Colors.grey, width: 2),
//                   borderRadius: BorderRadius.circular(18),
//                 ),


// floatingActionButton: FloatingActionButton(
//         isExtended: true,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const FavPage(),
//             ),
//           );
//         },
//         backgroundColor: Colors.amber,
//         child: const Badge(
//           alignment: Alignment.topCenter,
//           // isLabelVisible: false,
//           label: Text("2"),
//           child: Icon(Icons.favorite_rounded),
//         ),
//       ),