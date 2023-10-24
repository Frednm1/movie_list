import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/models/movies_model.dart';

class FavoritesController extends ChangeNotifier {
  List<Search> favoriteList = [];
  final db = FirebaseFirestore.instance;
  List<Search> get getFavoriteList => favoriteList;
  String username = 'fred';

  FavoritesController() {
    fetchFromFirebase();
  }
  fetchFromFirebase() async {
    await db
        .collection('users')
        .doc(username)
        .collection('movies')
        .get()
        .then((value) {
      if (value.docs.isNotEmpty == true) {
        for (var element in value.docs) {
          favoriteList.add(Search(
            imdbID: element.get('imdbID'),
            poster: element.get('poster'),
            title: element.get('title'),
            type: element.get('type'),
            year: element.get('year'),
          ));
        }
      }
    });
  }
  /*
      Como não implementamos um sistema de login coloquei o nome
      do usuário de forma manual
    */

  addFavorite(Search movie) async {
    favoriteList.add(movie);
    await db
        .collection('users')
        .doc(username)
        .collection('movies')
        .where('imdbID', isEqualTo: "${movie.imdbID}")
        .get()
        .then((value) async {
      if (value.docs.isEmpty == true) {
        await db.collection('users').doc(username).collection('movies').add({
          "title": "${movie.title}",
          "year": "${movie.year}",
          "imdbID": "${movie.imdbID}",
          "type": "${movie.type}",
          "poster": "${movie.poster}"
        });
      }
    });

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
        .where("imdbID", isEqualTo: "${movie.imdbID}")
        .get()
        .then((value) async {
      await db.doc(value.docs.first.reference.path).delete();
    });

    notifyListeners();
  }
}
