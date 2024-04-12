import 'package:ayana_test/pages/home_image_page.dart';
import 'package:ayana_test/pages/home_video_page%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeVideoPage()));
                    },
                    child: const Text("VIDEO"))),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeImagePage()));
                    },
                    child: const Text("IMAGE"))),
          ],
        ),
      ),
    );
  }
}
