// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_list/models/movie_description_model.dart';

import 'package:movie_list/models/movies_model.dart';
import 'package:movie_list/pages/loading_page.dart';
import 'package:movie_list/services/request.dart';

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
                        child: Wrap(
                          children: [
                            const Text(
                              'Title: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movieDescription.title ?? 'N/A',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: Wrap(
                          children: [
                            const Text(
                              'Plot: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movieDescription.plot ?? 'N/A',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: Wrap(
                          children: [
                            const Text(
                              'Runtime: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movieDescription.runtime ?? 'N/A',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: Wrap(
                          children: [
                            const Text(
                              'Year: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movieDescription.year ?? 'N/A',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: Wrap(
                          children: [
                            const Text(
                              'Genre: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movieDescription.genre ?? 'N/A',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 1),
                        child: Wrap(
                          children: [
                            const Text(
                              'Director: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movieDescription.director ?? 'N/A',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        child: Wrap(
                          children: [
                            const Text(
                              'Writer: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movieDescription.writer ?? 'N/A',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        child: Wrap(
                          children: [
                            const Text(
                              'Actors: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              movieDescription.actors ?? 'N/A',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        child: Wrap(
                          children: [
                            const Text(
                              'Ratings: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            movieDescription.ratings?.isNotEmpty == true
                                ? ListView.builder(
                                    itemCount: movieDescription.ratings!.length,
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
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
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