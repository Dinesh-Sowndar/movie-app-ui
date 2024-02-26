import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/widgets/movie_card.dart';

final List<String> movieListBack = [
  'assets/images/bloodshot_back.jpg',
  'assets/images/dolittle_back.jpg',
  'assets/images/mulan_back.jpeg',
  'assets/images/sonic_back.jpg',
  'assets/images/the_call_of_the_wild_back.jpg',
];

final List<Movie> movieList = [
  Movie(
    name: 'Bloodshot',
    poster: 'assets/images/bloodshot.jpg',
  ),
  Movie(
    name: 'Dolittle',
    poster: 'assets/images/dolittle.jpg',
  ),
  Movie(
    name: 'Mulan',
    poster: 'assets/images/mulan.jpg',
  ),
  Movie(
    name: 'Sonic',
    poster: 'assets/images/sonic.jpg',
  ),
  Movie(
    name: 'The call of the wild',
    poster: 'assets/images/the_call_of_the_wild.jpg',
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();
  final ScrollController _scrollController = ScrollController();
  final List<Widget> imageSliders = movieList
      .map((item) => MovieCardWidget(
            movie: item,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView.builder(
              controller: _scrollController,
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: movieListBack.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      image: DecorationImage(
                        image: ExactAssetImage(movieListBack[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.6)),
                    ));
              }),
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              aspectRatio: 2,
              viewportFraction: 0.68,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onScrolled: (double? offset) {
                _scrollController.jumpTo(
                  offset! * MediaQuery.of(context).size.width,
                );
              },
            ),
            items: imageSliders,
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.amber[600],
          minimumSize: Size(MediaQuery.of(context).size.width * 0.80, 45),
        ),
        onPressed: () {},
        child: Text(
          "Book now".toUpperCase(),
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
