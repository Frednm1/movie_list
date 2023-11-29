// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_list/components/movie_container_widget.dart';
import 'package:movie_list/pages/movie_description.dart';
import 'package:movie_list/store/search_store.dart';

class SearchPage extends StatelessWidget {
  final searchInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final store = SearchStore();
  SearchPage({
    Key? key,
  }) : super(key: key);

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
              Observer(
                builder: (context) {
                  return store.loading
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: CircularProgressIndicator(
                              color: Colors.red,
                            )),
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: store.movieList.length,
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
                                          movie: store.movieList[i]!,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: MovieContainerWidget(
                                  movie: store.movieList[i]!,
                                ),
                              );
                            },
                          ),
                        );
                },
              )
            ],
          ),
        );
      },
    );
  }

  search() async {
    store.setLoading(true);
    await store.search(searchInputController.value.text);
    store.setLoading(false);
  }
}
