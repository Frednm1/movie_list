// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_list/controllers/favorites_controller.dart';
import 'package:movie_list/models/movie_description_model.dart';

import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/pages/loading_page.dart';
import 'package:movie_list/services/request.dart';
import 'package:provider/provider.dart';

class MovieDescription extends StatefulWidget {
  final Search movie;
  const MovieDescription({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  bool isLoading = true;
  late MovieDescriptionModel movieDescription;
  late FavoritesController favoritesController;
  @override
  void initState() {
    loading().then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    favoritesController = Provider.of<FavoritesController>(context);
    return isLoading
        ? const LoadingPage()
        : LayoutBuilder(
            builder: (context, constraints) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  title: Text(
                    widget.movie.title!,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 300,
                        width: constraints.maxWidth,
                        child: Image.network(
                          widget.movie.poster!,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 1),
                          child: movieDescription.title != null
                              ? Wrap(
                                  children: [
                                    const Text(
                                      'Title: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      movieDescription.title!,
                                    ),
                                  ],
                                )
                              : Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: movieDescription.title != null
                            ? Wrap(
                                children: [
                                  const Text(
                                    'Plot: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    movieDescription.plot!,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 1),
                          child: movieDescription.title != null
                              ? Wrap(
                                  children: [
                                    const Text(
                                      'Runtime: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      movieDescription.runtime!,
                                    ),
                                  ],
                                )
                              : Container()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: movieDescription.title != null
                            ? Wrap(
                                children: [
                                  const Text(
                                    'Year: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    movieDescription.year!,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: movieDescription.title != null
                            ? Wrap(
                                children: [
                                  const Text(
                                    'Genre: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    movieDescription.genre!,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: movieDescription.title != null
                            ? Wrap(
                                children: [
                                  const Text(
                                    'Director: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    movieDescription.director!,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        child: movieDescription.title != null
                            ? Wrap(
                                children: [
                                  const Text(
                                    'Writer: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    movieDescription.writer!,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        child: movieDescription.title != null
                            ? Wrap(
                                children: [
                                  const Text(
                                    'Actors: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    movieDescription.actors!,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        child: movieDescription.title != null
                            ? Wrap(
                                children: [
                                  const Text(
                                    'Ratings: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  movieDescription.ratings?.isNotEmpty == true
                                      ? ListView.builder(
                                          itemCount:
                                              movieDescription.ratings!.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, i) {
                                            return Wrap(
                                              children: [
                                                Text(
                                                  ' *${movieDescription.ratings![i]!.source} :',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                    '${movieDescription.ratings![i]!.value}')
                                              ],
                                            );
                                          })
                                      : const Text('N/A'),
                                ],
                              )
                            : Container(),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    if (favoritesController.getFavoriteList.where(
                      (element) {
                        if (element.imdbID == widget.movie.imdbID) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                    ).isNotEmpty) {
                      favoritesController.removeFavorite(widget.movie);
                    } else {
                      favoritesController.addFavorite(widget.movie);
                    }
                  },
                  backgroundColor: Colors.blueAccent,
                  child: favoritesController.getFavoriteList.where(
                    (element) {
                      if (element.imdbID == widget.movie.imdbID) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                  ).isNotEmpty
                      ? const Icon(
                          Icons.star,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.star_outline,
                          color: Colors.white,
                        ),
                ),
              );
            },
          );
  }

  loading() async {
    var response = await Request().searchMovie(queryParemeters: {
      "apikey": "e894a4f1",
      "i": widget.movie.imdbID!,
    });
    movieDescription = MovieDescriptionModel.fromJson(
      jsonDecode(response.body),
    );
  }
}
