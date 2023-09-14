import 'package:flutter/material.dart';
import 'package:shorebird_recipes/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: const Color(0xff263341),
              secondary: const Color(0xff8DB646),
            ),
      ),
      home: const HomePage(),
    );
  }
}
