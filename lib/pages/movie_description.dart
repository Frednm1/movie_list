// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_list/models/movie_description_model.dart';
import 'package:movie_list/models/movies_model.dart';

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
  late MovieDescriptionModel movieDescription;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container();
        // Scaffold(
        //   appBar: AppBar(
        //     centerTitle: true,
        //     iconTheme: const IconThemeData(
        //       color: Colors.white,
        //     ),
        //     title: Text(
        //       widget.movie.title!,
        //       style: const TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //     backgroundColor: Colors.blueAccent,
        //   ),
        //   body: SingleChildScrollView(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         SizedBox(
        //           height: 300,
        //           width: constraints.maxWidth,
        //           child: Image.network(
        //             widget.movie.poster!,
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         Padding(
        //             padding:
        //                 const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
        //             child: movieDescription.title != null
        //                 ? Wrap(
        //                     children: [
        //                       const Text(
        //                         'Title: ',
        //                         style: TextStyle(
        //                           fontWeight: FontWeight.bold,
        //                         ),
        //                       ),
        //                       Text(
        //                         movieDescription.title!,
        //                       ),
        //                     ],
        //                   )
        //                 : Container()),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
        //           child: movieDescription.title != null
        //               ? Wrap(
        //                   children: [
        //                     const Text(
        //                       'Plot: ',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     Text(
        //                       movieDescription.plot!,
        //                     ),
        //                   ],
        //                 )
        //               : Container(),
        //         ),
        //         Padding(
        //             padding:
        //                 const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
        //             child: movieDescription.title != null
        //                 ? Wrap(
        //                     children: [
        //                       const Text(
        //                         'Runtime: ',
        //                         style: TextStyle(
        //                           fontWeight: FontWeight.bold,
        //                         ),
        //                       ),
        //                       Text(
        //                         movieDescription.runtime!,
        //                       ),
        //                     ],
        //                   )
        //                 : Container()),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
        //           child: movieDescription.title != null
        //               ? Wrap(
        //                   children: [
        //                     const Text(
        //                       'Year: ',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     Text(
        //                       movieDescription.year!,
        //                     ),
        //                   ],
        //                 )
        //               : Container(),
        //         ),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
        //           child: movieDescription.title != null
        //               ? Wrap(
        //                   children: [
        //                     const Text(
        //                       'Genre: ',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     Text(
        //                       movieDescription.genre!,
        //                     ),
        //                   ],
        //                 )
        //               : Container(),
        //         ),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
        //           child: movieDescription.title != null
        //               ? Wrap(
        //                   children: [
        //                     const Text(
        //                       'Director: ',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     Text(
        //                       movieDescription.director!,
        //                     ),
        //                   ],
        //                 )
        //               : Container(),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 30,
        //             vertical: 1,
        //           ),
        //           child: movieDescription.title != null
        //               ? Wrap(
        //                   children: [
        //                     const Text(
        //                       'Writer: ',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     Text(
        //                       movieDescription.writer!,
        //                     ),
        //                   ],
        //                 )
        //               : Container(),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 30,
        //             vertical: 1,
        //           ),
        //           child: movieDescription.title != null
        //               ? Wrap(
        //                   children: [
        //                     const Text(
        //                       'Actors: ',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     Text(
        //                       movieDescription.actors!,
        //                     ),
        //                   ],
        //                 )
        //               : Container(),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 30,
        //             vertical: 1,
        //           ),
        //           child: movieDescription.title != null
        //               ? Wrap(
        //                   children: [
        //                     const Text(
        //                       'Ratings: ',
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     movieDescription.ratings?.isNotEmpty == true
        //                         ? ListView.builder(
        //                             itemCount: movieDescription.ratings!.length,
        //                             shrinkWrap: true,
        //                             physics:
        //                                 const NeverScrollableScrollPhysics(),
        //                             itemBuilder: (context, i) {
        //                               return Wrap(
        //                                 children: [
        //                                   Text(
        //                                     ' *${movieDescription.ratings![i]!.source} :',
        //                                     style: const TextStyle(
        //                                       fontWeight: FontWeight.w500,
        //                                     ),
        //                                   ),
        //                                   Text(
        //                                       '${movieDescription.ratings![i]!.value}')
        //                                 ],
        //                               );
        //                             })
        //                         : const Text('N/A'),
        //                   ],
        //                 )
        //               : Container(),
        //         ),
        //         const SizedBox(
        //           height: 40,
        //         )
        //       ],
        //     ),
        //   ),
        //   floatingActionButton: FloatingActionButton(
        //     onPressed: () {},
        //     backgroundColor: Colors.blueAccent,
        //     child: const Icon(Icons.star, color: Colors.white),
        //   ),
        // );
      },
    );
  }

  loading() async {
    /*
    Busca os Dados do filme
    queryParameters = {
      "apikey": "e894a4f1",
      "i": widget.movie.imdbID!,
    }
    */
  }
}
