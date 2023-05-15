import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/achievement/achievement.dart';
import 'package:home_fitness/screens/home/home.dart';
import 'package:home_fitness/screens/notification/notification.dart';
import 'package:home_fitness/screens/profile/profile.dart';
import 'package:home_fitness/screens/workout/workout.dart';
import 'package:provider/provider.dart';

import '../sign_up/get_info.dart';

class Launcher extends StatefulWidget {
  // const Launcher({Key? key}) : super(key: key);

  final String docId;
  const Launcher({Key? key, required this.docId}) : super(key: key);

  @override
  LauncherState createState() => LauncherState();
}

class LauncherState extends State<Launcher> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screens = const [
    Home(),
    Achievement(),
    Workout(),
    Profile(),
    Notifications()
  ];

  final items = <Widget>[
    const Icon(
      Icons.home_outlined,
      size: 30,
    ),
    const Icon(
      Icons.bar_chart_outlined,
      size: 30,
    ),
    const Icon(
      Icons.run_circle_outlined,
      size: 30,
    ),
    const Icon(
      Icons.account_circle_outlined,
      size: 30,
    ),
    const Badge(
        // badgeContent: Text('1'),
        child: Icon(
      Icons.notifications_none_outlined,
      size: 30,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    Future<User?> readUserDB(String docId) async {
      /// Get single document by ID
      final docUser = FirebaseFirestore.instance.collection('users').doc(docId);
      final snapshot = await docUser.get();

      // try {
      if (snapshot.exists) {
        print(' Snapshot: ${snapshot.data()}');
        return User.fromJson(snapshot.data() as Map<String, dynamic>);
      }
      return null;
      // }catch(e){
      //   print('Error Fetching user from DB');
      // }
    }

    return FutureBuilder(
      future: readUserDB(widget.docId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text('Something Went wrong! :: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final user = snapshot.data;
          return user == null
              ? GetInfo(email: widget.docId)
              : buildScaffold(context, user);
          // return buildScaffold(context, user);
        } else {
          return GetInfo(email: widget.docId);
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
        }
      },
    );
  }

  Widget buildScaffold(BuildContext context, User user) {
    Provider.of<UserProvider>(context, listen: false).updateUser(user);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey,
      // appBar: AppBar(
      //   title: Text('Home Fitness'),
      //   centerTitle: true,
      //   // elevation: 0,
      //
      // ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.green,
          backgroundColor: Colors.transparent,
          items: items,
          index: index,
          height: 60,
          animationCurve: Curves.easeInOutBack,
          animationDuration: const Duration(milliseconds: 800),
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
