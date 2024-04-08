import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengroocer/src/config/splash_screen.dart';
import 'package:greengroocer/src/page_routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VerdFrut',
      
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190)
      ),
      
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutes.splashRoute,
      getPages: AppPages.pages,
      
    );
    
  }
}

