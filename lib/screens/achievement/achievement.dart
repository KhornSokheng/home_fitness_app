import 'package:auto_size_text/auto_size_text.dart';
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


    List<Activity> activity_list = [
      Activity(
          name: 'Heart Rate',
          unit: 'bpm',
          value: user.heartRate.toString(),
          image_url: 'assets/heart1.png'
      ),
      Activity(
          name: 'Steps',
          unit: 'steps',
          value: user.step.toString(),
          image_url: 'assets/shoe3.png'
      ),
      Activity(
          name: 'Calories Burn',
          unit: 'Kcal',
          value: user.calories_burn.toString(),
          image_url: 'assets/cal_burn2.png',
          reached: false
      ),
      Activity(
          name: 'Distance Walked',
          unit: 'KM',
          value: user.distance_walk!.toStringAsFixed(2),
          image_url: 'assets/milestone1.png',
          reached: false
      ),
      // Activity(
      //       name: 'Distance Walked',
      //       unit: 'KM',
      //       value: user.distance_walk!.toStringAsFixed(2),
      //       image_url: 'assets/walking.png'
      //   ),

    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Your Achievement"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              // color: Colors.white,
              padding: EdgeInsets.all(5),
              child: const AutoSizeText(
                  'Daily Activities',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: 300,
              // width: 500,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityCard(activity: activity_list[index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 5,);
                },
                itemCount: activity_list.length,

              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              // color: Colors.white,
              padding: EdgeInsets.all(5),
              child: const AutoSizeText(
                'Milestones',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: 300,
              // width: 500,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityCard(activity: activity_list[index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 5,);
                },
                itemCount: activity_list.length,

              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: 300,
              // width: 500,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityCard(activity: activity_list[index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 5,);
                },
                itemCount: activity_list.length,

              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
