

import 'package:final_exam_flutter/view/homepage/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 400, left: 65),
            child: GestureDetector(
              onTap: () {
                Get.to(HomeScreen());
              },
              child: Container(
                height: 180,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('asset/img/logo.png')),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
