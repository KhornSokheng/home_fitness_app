import 'package:flutter/material.dart';
import 'package:home_fitness/providers/events_provider.dart';
import 'package:home_fitness/providers/google_sign_in.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/providers/video_provider.dart';
import 'package:home_fitness/screens/sign_up/Utils.dart';
import 'package:home_fitness/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

        ),
        ChangeNotifierProvider(
          create: (context)=> EventsProvider(),

        ),
        ChangeNotifierProvider(
          create: (context)=> GoogleSignInProvider(),

        ),
        ChangeNotifierProvider(
          create: (context)=> VideoProvider(),

        )
      ],

      child: MaterialApp(
        title: 'Home Fitness',
        scaffoldMessengerKey: messengerKey,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const Wrapper(),
      ),
    );
  }
}

