import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_test/controllers/movieController.dart';

import 'moviePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: const Text(
          'Movies',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontFamily: "Poppins"),
        ),
      ),
      body: const MoviesPage(),
    );
  }
}
