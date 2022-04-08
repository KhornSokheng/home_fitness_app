// this file is the back up of the workout page



import 'package:flutter/material.dart';
import 'package:home_fitness/models/video.dart';
// import 'package:home_fitness/screens/achievement/activity_card.dart';
// import 'package:home_fitness/models/activity.dart';
// import 'package:home_fitness/screens/workout/levelcard.dart';
import 'package:grouped_list/grouped_list.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {

  final List _elements = [
    // {'title': 'Basic Yoga', 'type': 'For You','duration': '5','level': 'Easy'},
    // {'title': 'Warm-Up Stretch', 'type': 'For You','duration': '9','level': 'Easy'},
    // {'title': '5-Minute Plank', 'type': 'For You','duration': '5','level': 'Medium'},
    // {'title': 'Runner Warm-Up', 'type': 'New Workouts','duration': '5','level': 'Easy'},
    // {'title': 'Muscle Builder', 'type': 'New Workouts','duration': '7','level': 'Medium'},
    // {'title': '10-Minutes Bodyweight Burn', 'type': 'Popular','duration': '10','level': 'hard'},
  ];


  List<Video> workoutVideos = [
    Video(title: 'Basic Yoga', level: 'Easy', type: 'For You',duration: 5),
    Video(title: 'Warm-Up Stretch', level: 'Easy', type: 'For You',duration: 7),
    Video(title: '5-Minute Plank', level: 'Medium', type: 'For You',duration: 5),
    Video(title: 'Runner Warm-Up', level: 'Easy', type: 'New Workouts',duration: 6),
    Video(title: 'Muscle Builder', level: 'Medium', type: 'New Workouts',duration: 9),
    Video(title: '10-Minutes Bodyweight Burn', level: 'Hard', type: 'Popular',duration: 6),
    Video(title: 'Abs & Core', level: 'Easy', type: 'Popular',duration: 9),
    Video(title: 'Master Yoga', level: 'hard', type: 'Popular',duration: 4),
  ];

  @override
  Widget build(BuildContext context) {


    workoutVideos.map((e) {
      print(e.title);

      _elements.add(e.toJson());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Workouts"),
        centerTitle: true,
      ),
      body: GroupedListView<dynamic, String>(
        elements: _elements,
        groupBy: (element) => element['type'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['title'].compareTo(item2['title']),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (c, element) {

          // wrap with a gestureDetector
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Image.asset('assets/default_thumbnail.png'),
                title: Text('${element['title']} (${element['level']}): ${element['duration']}mns'),
                // title: Row(
                //   children: [
                //     Text(element['title']),
                //     SizedBox(width: 5,),
                //     Text(element['level']),
                //   ],
                // ),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          );
        },
      ),
    );
  }

}
