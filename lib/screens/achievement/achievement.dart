import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/activity.dart';
import 'package:home_fitness/models/milestone.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/achievement/activity_card.dart';
import 'package:home_fitness/screens/achievement/milestone_card.dart';
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


    List<Activity> activityList = [
      Activity(
          name: 'No. Workouts', unit: 'videos',value: user.num_workout.toString(),image_url: 'assets/num_workout3.png'
      ),
      Activity(
          name: 'No. Minutes', unit: 'mns',value: user.minute_play.toString(),image_url: 'assets/minute3.png'
      ),
      Activity(
          name: 'Steps',unit: 'steps',value: user.step.toString(),
          image_url: 'assets/shoe3.png'
      ),
      Activity(
          name: 'Calories Burn',unit: 'Kcal',value: user.calories_burn.toString(),
          image_url: 'assets/cal_burn2.png',
          // reached: false
      ),
      Activity(
          name: 'Distance Walked',unit: 'KM',value: user.distance_walk!.toStringAsFixed(2),
          image_url: 'assets/walking.png',
          // reached: false
      ),
    ];

    List<Milestone> workoutMilestoneList = [
      Milestone(name: 'Workouts', unit: '', value: 1, image_url: 'assets/milestone1.png'),
      Milestone(name: 'Workouts', unit: '', value: 5, image_url: 'assets/milestone1.png'),
      Milestone(name: 'Workouts', unit: '', value: 10, image_url: 'assets/milestone1.png', ),
      Milestone(name: 'Workouts', unit: '', value: 15, image_url: 'assets/milestone1.png',
          reached: false),


    ];

    List<Milestone> minuteMilestoneList = [
      Milestone(name: 'Minutes', unit: '', value: 50, image_url: 'assets/clock5.png'),
      Milestone(name: 'Minutes', unit: '', value: 100, image_url: 'assets/clock5.png'),
      Milestone(name: 'Minutes', unit: '', value: 150, image_url: 'assets/clock5.png', reached: false),
      Milestone(name: 'Minutes', unit: '', value: 200, image_url: 'assets/clock5.png', reached: false),


    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Your Achievement"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 52),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              // color: Colors.white,
              padding: EdgeInsets.all(5),
              child: const AutoSizeText(
                  'Activities',
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
                  return ActivityCard(activity: activityList[index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 5,);
                },
                itemCount: activityList.length,

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
                  return MilestoneCard(milestone : workoutMilestoneList[index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 5,);
                },
                itemCount: workoutMilestoneList.length,

              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: 300,
              // width: 500,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return MilestoneCard(milestone: minuteMilestoneList[index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 5,);
                },
                itemCount: minuteMilestoneList.length,

              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
