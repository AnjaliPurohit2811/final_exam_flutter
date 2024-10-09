import 'package:final_exam_flutter/controller/getx_controller.dart';
import 'package:final_exam_flutter/view/homepage/home_screen.dart';
import 'package:final_exam_flutter/view/likedpage/add_to_like.dart';
import 'package:final_exam_flutter/view/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    home: SplashPage(),
    );
  }
}
