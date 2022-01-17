import 'package:flutter/material.dart';
import 'package:dentist_flutter/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Рецепты блюд',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme:  const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        )
    ),
      home: const HomePage() ,
    );
  }
}