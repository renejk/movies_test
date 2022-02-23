import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_test/controllers/movieController.dart';

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
            child: !controll.reload ? Text("data") : Text("reconectar"),
          );
        });
  }
}
