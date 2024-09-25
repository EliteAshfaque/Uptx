import 'package:demo/views/list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPTX',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        cardColor: Colors.grey[850], // Darker card color
        scaffoldBackgroundColor: Colors.black,
      ),
      home: ListPage(),
    );
  }
}
