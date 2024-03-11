import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VerdFrut',
      
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190)
      ),
      
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      
    );
    
  }
}

