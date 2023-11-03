import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list/components/movie_container_widget.dart';
import 'package:movie_list/controllers/favorites_controller.dart';
import 'package:movie_list/pages/loading_page.dart';
import 'package:movie_list/pages/movie_description.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late final FavoritesController controller;

  @override
  void initState() {
    super.initState();
    controller = FavoritesControllerSingleton().getFavoritesController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 236, 236),
      appBar: AppBar(
        title: const Text(
          'Favorites',
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
              : ListView.builder(
                  itemCount: controller.getFavorites.length,
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
                                movie: controller.getFavorites[i],
                              );
                            },
                          ),
                        );
                      },
                      child: MovieContainerWidget(
                        movie: controller.getFavorites[i],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
