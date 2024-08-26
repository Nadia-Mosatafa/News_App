import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/views/home_view.dart';

// news app
void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
