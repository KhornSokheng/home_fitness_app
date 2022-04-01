import 'dart:async';
// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/screens/sign_up/get_info.dart';
import 'package:home_fitness/screens/sign_up/sign_up.dart';
import 'package:home_fitness/screens/achievement/achievement.dart';
import 'package:home_fitness/screens/admin/admin_report.dart';
import 'package:home_fitness/screens/home/home.dart';
import 'package:home_fitness/screens/login/login.dart';
import 'package:home_fitness/screens/notification/notification.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'package:home_fitness/models/user.dart' as fitness_user;

import 'bottom_menu_bar/launcher.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Launcher();
    return LoginOrMenu();
  }
}

class LoginOrMenu extends StatelessWidget {
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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final googleUser = FirebaseAuth.instance.currentUser!;
            print(googleUser);

            // TODO
            // when database created,
            //need to fetch data from the database before setup to local provider


            // readUserDB(googleUser.email!);
            // Future.delayed(Duration(seconds: 60));
            //
            // if (userInDB.email == null) {
            //   return GetInfo(email: googleUser.email!);
            // } else {
            //
            //   Provider.of<UserProvider>(context, listen: false)
            //       .updateUser(userInDB);
            //   return Launcher();
            // }

            return Launcher( docId: googleUser.email!);

          } else if (snapshot.hasError) {
            return Center(child: Text('Something Went Wrong!'));
          } else {
            return LogIn();
          }

          // return Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //           onPressed: () {
          //             Navigator.push(context,
          //                 MaterialPageRoute(builder: (BuildContext context) {
          //               return LogIn();
          //             }));
          //           },
          //           child: Text('Login Test')),
          //       SizedBox(
          //         width: 100,
          //       ),
          //       ElevatedButton(
          //           onPressed: () {
          //             // MaterialPageRoute(builder: (BuildContext context) {
          //             //   return Launcher();
          //             // });
          //             Navigator.push(context,
          //                 MaterialPageRoute(builder: (BuildContext context) {
          //               return Launcher();
          //             }));
          //           },
          //           child: Text('Go to Menu')),
          //       SizedBox(
          //         width: 100,
          //       ),
          //       ElevatedButton(
          //           onPressed: () {
          //             // MaterialPageRoute(builder: (BuildContext context) {
          //             //   return Launcher();
          //             // });
          //             Navigator.push(context,
          //                 MaterialPageRoute(builder: (BuildContext context) {
          //               return GetInfo(
          //                 email: 'exam@go.com',
          //                 // password: '123456',
          //               );
          //             }));
          //           },
          //           child: Text('Get Info'))
          //     ],
          //   ),
          // );
        });
  }
}
