import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/services/request.dart';

class SearchPageController extends ChangeNotifier {
  List<Search?> searchedItems = [];
  List<Search?> get getSearchedItems => searchedItems;

  bool loading = false;
  bool get isLoading => loading;

  bool error = false;
  bool get haveError => error;

  searchMovies(String movieTitle) async {
    loading = true;
    notifyListeners();

    var response = await Request().searchMovie(queryParemeters: {
      "apikey": "e894a4f1",
      "s": movieTitle,
    });
    var data = jsonDecode(response.body);
    if (data['Error'] != null) {
      error = true;
    } else {
      error = false;
      var model = MoviesModel.fromJson(data);
      if (model.search?.isNotEmpty == true) {
        searchedItems = model.search!;
      }
    }

    loading = false;
    notifyListeners();
  }

  updateSeachedItems(List<Search> list) {
    searchedItems = list;
    notifyListeners();
  }

  clearItems() {
    searchedItems.clear();
    notifyListeners();
  }
}
