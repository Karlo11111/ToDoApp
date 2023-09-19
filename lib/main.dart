import 'package:flutter/material.dart';
import 'package:todoapp/pages/HomePage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),   
      theme: ThemeData(primaryColor: Colors.blue[200]),   
    );
  }
}


