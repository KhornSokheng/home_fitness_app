import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            buildAppBar(context),
          ],
        ),
      );

  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
        expandedHeight: MediaQuery.of(context).size.height * 0.5,
        title: Text('Statistics'),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.person, size: 28),
          SizedBox(
            width: 12,
          )
        ],
      );
}
/*import 'package:flutter/material.dart';
class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Your Workout"),
        centerTitle: true,
      ),
      body: Center(
          child: Text('Workout screen')
      ),
    );
  }
}*/
