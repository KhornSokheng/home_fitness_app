import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_fitness/models/activity.dart';
import 'package:home_fitness/screens/workout/workout.dart';

import '../../models/level.dart';

class LevelCard extends StatefulWidget {
  /*const LevelCard({Key? key}) : super(key: key);*/
  Level level;
  LevelCard({
    required this.level,
  });

  @override
  State<LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: AssetImage('assets/cal_burn.png'),
            height: 400,
            width: 400,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Text(
              widget.level.name,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
