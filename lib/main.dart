import 'package:flutter/material.dart';
import 'package:home_fitness/providers/events_provider.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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

        ),
        ChangeNotifierProvider(
          create: (context)=> EventsProvider(),

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

