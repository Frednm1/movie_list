import 'package:get/get.dart';
import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/services/firebase_service.dart';

class FavoritesController extends GetxController {
  static const String username = 'fred';
  RxBool loading = false.obs;
  bool get isLoading => loading.value;

  List<Search> favorites = <Search>[].obs;
  List<Search> get getFavorites => favorites;

  FavoritesController() {
    initializeFavorites();
  }

  Future<void> initializeFavorites() async {
    loading.value = true;
    var data = await FirebaseService().getFavoriteMovies(username);
    favorites.addAll(data);
    loading.value = false;
  }

  Future<void> add(Search movie) async {
    loading.value = true;
    await FirebaseService().addFavoriteMovie(movie, username);
    favorites.add(movie);
    loading.value = false;
  }

  Future<void> remove(Search movie) async {
    loading.value = true;
    await FirebaseService().removeFavoriteMovie(movie, username);
    favorites.remove(movie);
    loading.value = false;
  }
}
