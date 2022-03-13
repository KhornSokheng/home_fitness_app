import 'package:flutter/material.dart';
import 'package:home_fitness/models/level.dart';
import 'package:home_fitness/screens/achievement/activity_card.dart';
import 'package:home_fitness/models/activity.dart';
import 'package:home_fitness/screens/workout/levelcard.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Your Workout"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Flexible(
            child: LevelCard(
              level: Level(
                name: 'Easy',
                unit: '5',
                value: 50,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
