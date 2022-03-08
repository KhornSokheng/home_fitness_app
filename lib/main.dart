import 'package:flutter/material.dart';
import 'package:home_fitness/screens/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Fitness',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Wrapper(),
    );
  }
}

