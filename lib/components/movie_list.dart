import 'package:flutter/material.dart';
import 'dart:math';
import 'model.dart';

final List<Movie> initialMovieList = List.generate(
  40,
  (index) => Movie(
    "Movie #$index",
    "${Random().nextInt(100) + 60 + index} minutes",
  ),
);

class MovieProvider with ChangeNotifier {
  final List<Movie> _movieList = initialMovieList;
  List<Movie> get getMovies => _movieList;

  final List<Movie> _favList = [];
  List<Movie> get getFavorites => _favList;

  void addMovie(Movie movie) {
    _favList.add(movie);
    notifyListeners();
  }

  void deleteMovie(Movie movie) {
    _favList.remove(movie);
    notifyListeners();
  }
}
