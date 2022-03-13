import 'package:flutter/material.dart';
import 'package:home_fitness/models/activity.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/achievement/activity_card.dart';
import 'package:provider/provider.dart';

class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {

    User user = Provider.of<UserProvider>(context).user;
    user.generateData();  //generate some data for activities

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
                    name: 'Heart Rate',
                    unit: 'bpm',
                    value: user.heartRate.toString(),
                    image_url: 'assets/heart1.png'
                ),

              ),
            ),
            Flexible(
              child: ActivityCard(
                activity: Activity(
                    name: 'Steps',
                    unit: 'steps',
                    value: user.step.toString(),
                    image_url: 'assets/shoe3.png'
                ),

              ),
            ),
            Flexible(
              child: ActivityCard(
                activity: Activity(
                    name: 'Calories Burn',
                    unit: 'Kcal',
                    value: user.calories_burn.toString(),
                    image_url: 'assets/cal_burn2.png'
                ),

              ),
            ),
            Flexible(
              child: ActivityCard(
                activity: Activity(
                    name: 'Distance Walk',
                    unit: 'KM',
                    value: user.distance_walk!.toStringAsFixed(2),
                    image_url: 'assets/walking.png'
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }
}
