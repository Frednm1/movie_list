import 'package:flutter/material.dart';
import 'package:movie_list/models/movies_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late MoviesModel moviesList;
  @override
  Widget build(BuildContext context) {
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
                          controller: searchInputController,
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
                        searchInputController.clear();
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
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: moviesList.search!.length,
              //     padding: const EdgeInsets.only(
              //       bottom: 40,
              //     ),
              //     itemBuilder: (context, i) {
              //       return GestureDetector(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) {
              //                 return MovieDescription(
              //                   movie: moviesList.search![i]!,
              //                 );
              //               },
              //             ),
              //           );
              //         },
              //         child: MovieContainerWidget(
              //           movie: moviesList.search![i]!,
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }

  search() async {
    print('buscar filme');
    // var response = await Request().searchMovie(queryParemeters: {
    //   "apikey": "e894a4f1",
    //   "s": searchInputController.text,
    // });
    // data = jsonDecode(response.body);
  }
}
