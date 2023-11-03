// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list/controllers/favorites_controller.dart';
import 'package:movie_list/controllers/movie_description_controller.dart';
import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/pages/loading_page.dart';

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
  late MovieDescriptionController movieDescription;
  late FavoritesController favoritesController;
  @override
  void initState() {
    super.initState();
    movieDescription = MovieDescriptionController();
    favoritesController = FavoritesControllerSingleton().getFavoritesController;
    movieDescription.fetchMovieData(widget.movie.imdbID!);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(
          () {
            return movieDescription.isLoading
                ? const LoadingPage()
                : Scaffold(
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
                              child: movieDescription.getMovie!.title != null
                                  ? Wrap(
                                      children: [
                                        const Text(
                                          'Title: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          movieDescription.getMovie!.title!,
                                        ),
                                      ],
                                    )
                                  : Container()),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 1),
                            child: movieDescription.getMovie!.title != null
                                ? Wrap(
                                    children: [
                                      const Text(
                                        'Plot: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        movieDescription.getMovie!.plot!,
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 1),
                              child: movieDescription.getMovie!.title != null
                                  ? Wrap(
                                      children: [
                                        const Text(
                                          'Runtime: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          movieDescription.getMovie!.runtime!,
                                        ),
                                      ],
                                    )
                                  : Container()),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 1),
                            child: movieDescription.getMovie!.title != null
                                ? Wrap(
                                    children: [
                                      const Text(
                                        'Year: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        movieDescription.getMovie!.year!,
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 1),
                            child: movieDescription.getMovie!.title != null
                                ? Wrap(
                                    children: [
                                      const Text(
                                        'Genre: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        movieDescription.getMovie!.genre!,
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 1),
                            child: movieDescription.getMovie!.title != null
                                ? Wrap(
                                    children: [
                                      const Text(
                                        'Director: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        movieDescription.getMovie!.director!,
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
                            child: movieDescription.getMovie!.title != null
                                ? Wrap(
                                    children: [
                                      const Text(
                                        'Writer: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        movieDescription.getMovie!.writer!,
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
                            child: movieDescription.getMovie!.title != null
                                ? Wrap(
                                    children: [
                                      const Text(
                                        'Actors: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        movieDescription.getMovie!.actors!,
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
                            child: movieDescription.getMovie!.title != null
                                ? Wrap(
                                    children: [
                                      const Text(
                                        'Ratings: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      movieDescription.getMovie!.ratings
                                                  ?.isNotEmpty ==
                                              true
                                          ? ListView.builder(
                                              itemCount: movieDescription
                                                  .getMovie!.ratings!.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, i) {
                                                return Wrap(
                                                  children: [
                                                    Text(
                                                      ' *${movieDescription.getMovie!.ratings![i]!.source} :',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                        '${movieDescription.getMovie!.ratings![i]!.value}')
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
                      onPressed: () async {
                        if (!favoritesController.isLoading) {
                          if (favoritesController.getFavorites
                              .where((e) => e.imdbID == widget.movie.imdbID)
                              .isNotEmpty) {
                            await favoritesController.remove(widget.movie);
                          } else {
                            await favoritesController.add(widget.movie);
                          }
                        }
                      },
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        favoritesController.getFavorites
                                .where((e) => e.imdbID == widget.movie.imdbID)
                                .isEmpty
                            ? Icons.star_outline
                            : Icons.star,
                        color: Colors.white,
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
