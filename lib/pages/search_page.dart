import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list/bindings/search_binding.dart';
import 'package:movie_list/components/movie_container_widget.dart';
import 'package:movie_list/controllers/search_page_controller.dart';
import 'package:movie_list/pages/loading_page.dart';
import 'package:movie_list/pages/movie_description.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final SearchPageController controller;
  @override
  void initState() {
    super.initState();
    setUpSearch();
    controller = Get.find<SearchPageController>();
  }

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
          body: Obx(
            () {
              return controller.isLoading
                  ? const LoadingPage()
                  : Column(
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
                                  _formKey.currentState!.validate()
                                      ? controller.search(
                                          searchInputController.value.text)
                                      : null;
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
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.getSearchedItems.length,
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
                                          movie:
                                              controller.getSearchedItems[i]!,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: MovieContainerWidget(
                                  movie: controller.getSearchedItems[i]!,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
            },
          ),
        );
      },
    );
  }
}
