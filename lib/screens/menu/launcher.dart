import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_fitness/screens/achievement/achievement.dart';
import 'package:home_fitness/screens/home/home.dart';
import 'package:home_fitness/screens/notification/notification.dart';
import 'package:home_fitness/screens/profile/profile.dart';
import 'package:home_fitness/screens/workout/workout.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      Icon(Icons.home_outlined, size: 30,),
      Icon(Icons.grade_outlined , size: 30, ),
      // Icon(Icons.work_outline_outlined , size: 30,),
      Icon(Icons.ondemand_video_outlined , size: 30,),
      Icon(Icons.account_circle_outlined, size: 30,),
      Icon(Icons.notifications_none_outlined, size: 30,),



    ];


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
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white)
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.green,
          backgroundColor: Colors.transparent,
          items: items,
          index: index,
          height: 60,
          animationCurve: Curves.easeInOutBack ,
          animationDuration: Duration(milliseconds: 800),
          onTap: (index)=> setState(()=> this.index = index),

        ),
      ),
    );
  }
}
