import 'package:flutter/material.dart';
import 'package:home_fitness/models/activity.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [

            Flexible(
              // flex: 3,
              child: ActivityCard(
                activity: Activity(
                    name: 'Heartbeat',
                    unit: 'bpm',
                    value: 90,
                    image_url: 'assets/heart1.png'
                ),

              ),
            ),
            Flexible(
              child: ActivityCard(
                activity: Activity(
                    name: 'Steps',
                    unit: 'steps',
                    value: 2350,
                    image_url: 'assets/shoe3.png'
                ),

              ),
            ),
            Flexible(
              child: ActivityCard(
                activity: Activity(
                    name: 'Calories Burn',
                    unit: 'Kcal',
                    value: 1150,
                    image_url: 'assets/cal_burn2.png'
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }
}
