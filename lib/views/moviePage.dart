import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_test/controllers/movieController.dart';
import 'package:movies_test/models/movie.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
        init: MovieController(),
        builder: (controll) {
          return Container(
            color: Colors.white,
            height: 530,
            child: !controll.reload
                ? !controll.load
                    ? Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          Movie movie = controll.movies[index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Column(children: [
                                Expanded(
                                  child: Image.network(
                                    controll.loadImage(movie.posterPath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                            ),
                          );
                        },
                        autoplayDisableOnInteraction: true,
                        autoplay: true,

                        itemCount: controll.movies.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        // pagination: const SwiperPagination(),
                        control: const SwiperControl(),
                      )
                    : const Center(child: CircularProgressIndicator())
                : Center(
                    child: IconButton(
                        onPressed: () => controll.loadMovies(controll.page),
                        icon: const Icon(Icons.sync))),
          );
        });
  }
}
