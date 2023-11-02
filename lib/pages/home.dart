import 'package:flutter/material.dart';
import 'package:movie_list/controllers/favorites_controller.dart';
import 'package:movie_list/controllers/home_controller.dart';
import 'package:movie_list/pages/favorites.dart';
import 'package:movie_list/pages/search_page.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FavoritesController favoritesController;
  late HomeController homeController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    favoritesController = Provider.of<FavoritesController>(context);
    homeController = Provider.of<HomeController>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 239, 236, 236),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(
              color: Colors.blueAccent,
            ),
            fixedColor: Colors.blueAccent,
            currentIndex: homeController.getIndex,
            onTap: (index) {
              PageController().animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blueAccent,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                ),
                label: 'Stars',
              ),
            ],
          ),
          body: PageView(
            controller: PageController(),
            onPageChanged: (i) {
              homeController.changeIndex(i);
            },
            children: const [
              SearchPage(),
              Favorites(),
            ],
          ),
        );
      },
    );
  }

  toggleScreen(int value) {
    if (value == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Favorites();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        ),
      );
    }
  }
}
