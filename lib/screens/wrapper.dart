import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/screens/achievement/achievement.dart';
import 'package:home_fitness/screens/admin/admin_report.dart';
import 'package:home_fitness/screens/home/home.dart';
import 'package:home_fitness/screens/login/login.dart';
import 'package:home_fitness/screens/menu/launcher.dart';
import 'package:home_fitness/screens/notification/notification.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'package:home_fitness/models/user.dart' as fitness_user;

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


    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final google_user = FirebaseAuth.instance.currentUser!;
            print(google_user);

            // TODO
            // when database created,
            //need to fetch data from the database before setup to local provider

            Provider.of<UserProvider>(context, listen: false).updateUser(
              fitness_user.User(
                id: 3,
                username: google_user.displayName!,
                profile_img_url: google_user.photoURL!,
                email: google_user.email!,
                role: 'admin',
                  interest: ['Yoga','Muscle','Running']

              )
            );
            // Future.delayed(Duration(seconds: 5 ));

            // Navigator.push(context,
            // MaterialPageRoute(builder: (BuildContext context) {
            // return Launcher();}));
            return Launcher();
            // return LoggedInWidget();
          } else if (snapshot.hasError) {
            return Center(child: Text('Something Went Wrong!'));
          } else {
            // return loginreg();

          }

          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return loginreg();
                      }));
                    },
                    child: Text('Login Test')),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      // MaterialPageRoute(builder: (BuildContext context) {
                      //   return Launcher();
                      // });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Launcher();
                      }));
                    },
                    child: Text('Go to Menu')),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      // MaterialPageRoute(builder: (BuildContext context) {
                      //   return Launcher();
                      // });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AdminReport();
                      }));
                    },
                    child: Text('Log in as Admin'))
              ],
            ),
          );



        });
  }
}
