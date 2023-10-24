import 'package:flutter/material.dart';
import 'package:movie_list/components/movie_container_widget.dart';
import 'package:movie_list/controllers/favorites_controller.dart';
import 'package:movie_list/pages/movie_description.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late FavoritesController favoritesController;
  @override
  @override
  Widget build(BuildContext context) {
    favoritesController = Provider.of<FavoritesController>(context);
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
        body: ListView.builder(
          itemCount: favoritesController.getFavoriteList.length,
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
                        movie: favoritesController.getFavoriteList[i],
                      );
                    },
                  ),
                );
              },
              child: MovieContainerWidget(
                movie: favoritesController.getFavoriteList[i],
              ),
            );
          },
        ));
  }
}
