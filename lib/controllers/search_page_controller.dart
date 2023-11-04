import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/services/request.dart';

class SearchPageController extends GetxController {
  RxBool loading = false.obs;
  bool get isLoading => loading.value;

  List<Search?> searchedItems = <Search>[].obs;
  List<Search?> get getSearchedItems => searchedItems;

  Future<void> search(String title) async {
    loading.value = true;
    clear();
    var response = await Request().searchMovie(queryParemeters: {
      "apikey": "e894a4f1",
      "s": title,
    });
    var data = MoviesModel.fromJson(jsonDecode(response.body));
    if (data.search != null) {
      searchedItems.addAll(data.search!);
    }
    loading.value = false;
  }

  void clear() {
    searchedItems.clear();
  }
}
