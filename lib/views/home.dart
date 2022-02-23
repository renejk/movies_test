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
      bottomSheet: GetBuilder<MovieController>(
        init: MovieController(),
        builder: (controller) => Row(
          children: [
            Expanded(
                child: IconButton(
                    onPressed: () => controller.skip("back"),
                    icon: const Icon(Icons.arrow_back))),
            Expanded(
                child: IconButton(
                    onPressed: () => controller.skip("prev"),
                    icon: const Icon(Icons.arrow_back_ios))),
            Text(controller.page.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: IconButton(
                  onPressed: () => controller.skip("next"),
                  icon: const Icon(Icons.arrow_forward_ios)),
            ),
            Expanded(
                child: IconButton(
                    onPressed: () => controller.skip("skip"),
                    icon: const Icon(Icons.arrow_forward))),
          ],
        ),
      ),
    );
  }
}
