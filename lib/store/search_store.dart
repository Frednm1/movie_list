import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/services/request.dart';

part 'search_store.g.dart';

// ignore: library_private_types_in_public_api
class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  @observable
  ObservableList<Search?> movieList = ObservableList<Search?>();

  @observable
  bool loading = false;

  @action
  search(String title) async {
    var response = await Request().searchMovie(queryParemeters: {
      "apikey": "e894a4f1",
      "s": title,
    });
    var data = MoviesModel.fromJson(jsonDecode(response.body));
    movieList = ObservableList.of(data.search!);
  }

  @action
  setLoading(bool value) {
    loading = value;
  }
}
