import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 300,
          width: 200,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: Image.asset(movie.poster, fit: BoxFit.cover, width: 1000.0),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          movie.name,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Action ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Icon(
              Icons.brightness_1,
              color: Colors.white,
              size: 4,
            ),
            Text(
              " Adventure",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "4.0",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star,
              size: 12,
              color: Colors.white,
            ),
            Icon(
              Icons.star,
              size: 12,
              color: Colors.white,
            ),
            Icon(
              Icons.star,
              size: 12,
              color: Colors.white,
            ),
            Icon(
              Icons.star,
              size: 12,
              color: Colors.white,
            ),
            Icon(
              Icons.star_border,
              size: 12,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}
