import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/models/movies_model.dart';

class FavoritesController extends ChangeNotifier {
  List<Search> favoriteList = [];
  final db = FirebaseFirestore.instance;
  List<Search> get getFavoriteList => favoriteList;

  String username = 'fred';

  /*
      Como não implementamos um sistema de login coloquei o nome
      do usuário de forma manual
    */
  initializeFavoriteList() async {
    await db.collection('users').add({
      "name": username,
    });
    favoriteList.clear();
    await db
        .collection('users')
        .doc(username)
        .collection('movies')
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
      snapshot.docs.forEach((element) {});
    });

    notifyListeners();
  }

  addFavorite(Search movie) async {
    favoriteList.add(movie);
    await db
        .collection('users')
        .doc(username)
        .collection('movies')
        .add({"movie_id": "${movie.imdbID}"});

    notifyListeners();
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
    await db
        .collection('users')
        .doc(username)
        .collection('movies')
        .where("movie_id", isEqualTo: "${movie.imdbID}")
        .get()
        .then((value) async {
      await db.doc(value.docs.first.reference.path).delete();
    });

    notifyListeners();
  }
}
