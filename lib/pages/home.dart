// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:movie_list/pages/favorites.dart';
import 'package:movie_list/pages/search_page.dart';
import 'package:movie_list/store/home_store.dart';

final pages = [SearchPage(), const Favorites()];
final store = HomeStore();
final pc = PageController(initialPage: store.currentIndex);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 239, 236, 236),
          bottomNavigationBar: Observer(
            builder: (context) {
              return BottomNavigationBar(
                selectedLabelStyle: const TextStyle(
                  color: Colors.blueAccent,
                ),
                currentIndex: store.currentIndex,
                onTap: (index) {
                  pc.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease,
                  );
                  store.changeView(index);
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
                    activeIcon: Icon(
                      Icons.star,
                      color: Colors.blueAccent,
                    ),
                    label: 'Stars',
                  ),
                ],
              );
            },
          ),
          body: PageView(
            controller: pc,
            onPageChanged: (i) {
              store.changeView(i);
            },
            children: pages,
          ),
        );
      },
    );
  }
  // toggleScreen(int value) {
  //   if (value == 1) {
  //     Navigator.pushReplacement(
  //       ,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return const Favorites();
  //         },
  //       ),
  //     );
  //   } else {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return const Home();
  //         },
  //       ),
  //     );
  //   }
  // }
}
