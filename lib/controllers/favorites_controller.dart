import 'package:flutter/material.dart';
import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/services/firebase_service.dart';

class FavoritesController extends ChangeNotifier {
  List<Search> favoriteList = [];

  List<Search> get getFavoriteList => favoriteList;
  String username = 'fred';

  FavoritesController() {
    getFirebaseMovies();
  }

  getFirebaseMovies() async {
    favoriteList = await FirebaseService().getFavoriteMovies(username);
  }
  /*
      Como não implementamos um sistema de login coloquei o nome
      do usuário de forma manual
    */

  addFavorite(Search movie) async {
    favoriteList.add(movie);
    notifyListeners();
    FirebaseService().addFavoriteMovie(movie, username);
  }

  removeFavorite(Search movie) async {
    var data = favoriteList.where((element) {
      if (element.imdbID == movie.imdbID) {
        return true;
      } else {
        return false;
      }
    });
    favoriteList.remove(data.first);
    notifyListeners();
    FirebaseService().removeFavoriteMovie(movie, username);
  }
}
