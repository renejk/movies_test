import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_test/controllers/movie_controller.dart';
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
        return Stack(children: [
          Container(color: Colors.white, height: double.infinity),
          !controll.reload
              ? !controll.load
                  ? ListView(
                      children: [
                        Container(
                            color: Colors.white,
                            height: 400,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                Movie movie = controll.movies[index];
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: TrendingWidget(movie: movie),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              autoplayDisableOnInteraction: true,
                              autoplay: true,

                              itemCount: controll.movies.length,
                              viewportFraction: 0.7,
                              scale: 0.9,
                              // pagination: const SwiperPagination(),
                              // control: const SwiperControl(),
                            )),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("News",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: ScrollController(),
                          child: Row(
                              children: controll.news
                                  .map(
                                    (e) => NewsWidget(e: e),
                                  )
                                  .toList()),
                        )
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
              : Center(
                  child: IconButton(
                    onPressed: () => controll.reloadData(),
                    icon: const Icon(Icons.sync),
                  ),
                ),
        ]);
      },
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    Key? key,
    required this.e,
  }) : super(key: key);
  final Movie e;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
        init: MovieController(),
        builder: (controll) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  barrierDismissible: true,
                  pageBuilder: (BuildContext context, _, __) {
                    return GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        color: Colors.black38,
                        alignment: Alignment.center,
                        child: Material(
                          color: Colors.redAccent.withOpacity(0.0),
                          child: Hero(
                            tag: "image_${e.id}",
                            child: Stack(
                              children: [
                                Image.network(
                                  controll.loadImage(e.posterPath),
                                  fit: BoxFit.cover,
                                  height: 400.00,
                                  width: 300.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }));
            },
            child: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "image_${e.id}",
                  child: Image.network(
                    controll.loadImage(e.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      init: MovieController(),
      builder: (controll) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                barrierDismissible: true,
                pageBuilder: (BuildContext context, _, __) {
                  return GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      color: Colors.black38,
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.redAccent.withOpacity(0.0),
                        child: Hero(
                          tag: "image_${movie.id}",
                          child: Stack(
                            children: [
                              Image.network(
                                controll.loadImage(movie.posterPath),
                                fit: BoxFit.cover,
                                height: 400.00,
                                width: 300.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          child: Hero(
            tag: "image_${movie.id}",
            child: Image.network(
              controll.loadImage(movie.posterPath),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
