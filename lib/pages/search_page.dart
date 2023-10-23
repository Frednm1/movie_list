import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_list/components/movie_container_widget.dart';
import 'package:movie_list/controllers/favorites_controller.dart';
import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/pages/movie_description.dart';
import 'package:movie_list/services/request.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool haveError = false;
  bool haveData = false;
  late MoviesModel moviesList;
  late FavoritesController favoritesController;
  dynamic data;
  @override
  Widget build(BuildContext context) {
    favoritesController = Provider.of<FavoritesController>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 239, 236, 236),
          appBar: AppBar(
            title: const Text(
              'Search Movie',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
          ),
          body: Column(
            children: [
              Container(
                height: 60,
                width: constraints.maxWidth,
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Type a movie so we can search';
                            } else if (value.length < 3) {
                              return 'be a little more specific';
                            } else {
                              return null;
                            }
                          },
                          controller: searchController,
                          autocorrect: true,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                              ),
                            ),
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _formKey.currentState!.validate() ? search() : null;
                        FocusScope.of(context).unfocus();
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              haveError
                  ? Column(
                      children: [
                        Text(data['Error']),
                      ],
                    )
                  : haveData
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: moviesList.search!.length,
                            padding: const EdgeInsets.only(
                              bottom: 40,
                            ),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MovieDescription(
                                          movie: moviesList.search![i]!,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: MovieContainerWidget(
                                  movie: moviesList.search![i]!,
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
            ],
          ),
        );
      },
    );
  }

  search() async {
    var response = await Request().searchMovie(queryParemeters: {
      "apikey": "e894a4f1",
      "s": searchController.text,
    });
    data = jsonDecode(response.body);

    /*
      Quando a api do omdbapi não encontra nenhum filme ela retorna um erro e não uma lista vazia.
      Ou seja se tentarmos colocar no model causaria um erro, por isso a verificação é necessária
    */
    if (data['Error']?.isNotEmpty == true) {
      setState(() {
        haveError = true;
      });
    } else {
      setState(() {
        haveError = false;
        haveData = true;
        moviesList = MoviesModel.fromJson(data);
      });
    }
  }
}
