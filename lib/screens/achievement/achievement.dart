import 'package:flutter/material.dart';
import 'package:home_fitness/screens/achievement/activity_card.dart';

class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Your Achievement"),
        centerTitle: true,
      ),
      body: ActivityCard(

      ),
    );
  }
}
