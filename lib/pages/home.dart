import 'package:flutter/material.dart';
import 'package:movie_list/pages/favorites.dart';
import 'package:movie_list/pages/search_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    pc = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 239, 236, 236),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(
              color: Colors.blueAccent,
            ),
            fixedColor: Colors.blueAccent,
            currentIndex: currentPage,
            onTap: (index) {
              pc.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease);
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
            controller: pc,
            onPageChanged: (i) {
              setState(() {
                currentPage = i;
              });
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
}
