import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

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
      // body: ListView.builder(
      //   itemCount: ,
      //   padding: const EdgeInsets.only(
      //     bottom: 40,
      //   ),
      //   itemBuilder: (context, i) {
      //     return GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) {
      //               return MovieDescription(
      //                 movie: ,
      //               );
      //             },
      //           ),
      //         );
      //       },
      //       child: MovieContainerWidget(
      //         movie: ,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
