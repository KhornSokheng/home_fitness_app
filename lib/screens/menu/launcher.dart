import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/Reg/get_info.dart';
import 'package:home_fitness/screens/Reg/sign_up.dart';
import 'package:home_fitness/screens/achievement/achievement.dart';
import 'package:home_fitness/screens/home/home.dart';
import 'package:home_fitness/screens/notification/notification.dart';
import 'package:home_fitness/screens/profile/profile.dart';
import 'package:home_fitness/screens/workout/workout.dart';
import 'package:provider/provider.dart';

class Launcher extends StatefulWidget {
  // const Launcher({Key? key}) : super(key: key);

  String docId;
  Launcher({required this.docId});

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screens = [
    Home(),
    Achievement(),
    Workout(),
    Profile(),
    Notifications()
  ];

  final items = <Widget>[
    Icon(
      Icons.home_outlined,
      size: 30,
    ),
    // Icon(Icons.grade_outlined , size: 30, ),
    Icon(
      Icons.bar_chart_outlined,
      size: 30,
    ),
    // Icon(Icons.ondemand_video_outlined , size: 30,),
    Icon(
      Icons.run_circle_outlined,
      size: 30,
    ),
    Icon(
      Icons.account_circle_outlined,
      size: 30,
    ),
    Badge(
        badgeContent: Text('3'),
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
        return User.fromJson(snapshot.data() as Map<String, dynamic>);
      }
      // }catch(e){
      //   print('Error Fetching user from DB');
      // }
    }

    return FutureBuilder(
      future: readUserDB(widget.docId),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text('Someting Went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final user = snapshot.data;
          return user == null ? GetInfo(email: widget.docId) : buildScaffold(context, user);
          // return buildScaffold(context, user);
        } else {

          // return  GetInfo(email: widget.docId);
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildScaffold(BuildContext context, User user) {

    Provider.of<UserProvider>(context,listen:false).updateUser(user);

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
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.green,
          backgroundColor: Colors.transparent,
          items: items,
          index: index,
          height: 60,
          animationCurve: Curves.easeInOutBack,
          animationDuration: Duration(milliseconds: 800),
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
