import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_list/models/movie_description_model.dart';
import 'package:movie_list/services/request.dart';

class MovieDescriptionController extends GetxController {
  RxBool loading = false.obs;
  bool get isLoading => loading.value;

  MovieDescriptionModel? movie;
  MovieDescriptionModel? get getMovie => movie;

  Future<void> fetchMovieData(String movieID) async {
    loading.value = true;
    var data = await Request().searchMovie(queryParemeters: {
      "apikey": "e894a4f1",
      "i": movieID,
    });
    if (data.statusCode == 200) {
      movie = MovieDescriptionModel.fromJson(jsonDecode(data.body));
    } else {
      Exception('Something went wrong');
    }
    loading.value = false;
  }
}
