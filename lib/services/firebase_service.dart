import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_list/models/movies_model.dart';

class FirebaseService {
  final db = FirebaseFirestore.instance;

  Future<List<Search>> getFavoriteMovies(String username) async {
    List<Search> list = [];
    await db
        .collection('users')
        .doc(username)
        .collection('movies')
        .get()
        .then((value) {
      for (var element in value.docs) {
        list.add(Search(
          imdbID: element.get('imdbID'),
          poster: element.get('poster'),
          title: element.get('title'),
          type: element.get('type'),
          year: element.get('year'),
        ));
      }
    });
    return list;
  }

  Future<void> addFavoriteMovie(Search movie, String username) async {
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
  }

  Future<void> removeFavoriteMovie(Search movie, String username) async {
    await db
        .collection('users')
        .doc(username)
        .collection('movies')
        .where("imdbID", isEqualTo: "${movie.imdbID}")
        .get()
        .then((value) async {
      await db.doc(value.docs.first.reference.path).delete();
    });
  }
}
