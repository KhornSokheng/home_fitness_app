import 'package:flutter/material.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(
          create: (context)=> UserProvider(),

        )
      ],

      child: MaterialApp(
        title: 'Home Fitness',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}

