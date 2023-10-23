// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movie_list/models/movies_model.dart';

class MovieContainerWidget extends StatefulWidget {
  final Search movie;
  const MovieContainerWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieContainerWidget> createState() => _MovieContainerWidgetState();
}

class _MovieContainerWidgetState extends State<MovieContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            height: 120,
            width: 80,
            child: Image.network(
              widget.movie.poster!,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                    'https://igp.rs.gov.br/themes/modelo-noticias/images/outros/GD_imgSemImagem.png');
              },
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.movie.year!,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Text(widget.movie.type!)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
