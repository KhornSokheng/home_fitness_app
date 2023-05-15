import 'dart:async';
// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:home_fitness/screens/login/login.dart';
import 'package:home_fitness/models/user.dart' as fitness_user;

import 'bottom_menu_bar/launcher.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginOrMenu();
  }
}

class LoginOrMenu extends StatelessWidget {
  const LoginOrMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late fitness_user.User userInDB;
    var my_snapshot;

    Future readUserDB(String docId) async {
      /// Get single document by ID
      final docUser = FirebaseFirestore.instance.collection('users').doc(docId);
      final snapshot = await docUser.get();
      print(snapshot.data() as Map<String, dynamic>);
      print(snapshot.exists );

      try {
        if (snapshot.exists) {
          my_snapshot = snapshot.data();
          print(my_snapshot);
          userInDB = fitness_user.User.fromJson(snapshot.data() as Map<String, dynamic>);
          print(snapshot.data());
          // print(userInDB);
          print(userInDB.email);
          // return fitness_user.User.fromJson(snapshot.data()!);

        } else {
          // userInDB = null;
        }
      }catch(e){
        print('Error Fetching user from DB');
      }
    }

    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)  {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final googleUser = FirebaseAuth.instance.currentUser!;
            print(googleUser);

            return Launcher( docId: googleUser.email ?? 'test1@gmail.com');

          } else if (snapshot.hasError) {
            return const Center(child: Text('Something Went Wrong!'));
          } else {
            return LogIn();
          }
        });
  }
}
