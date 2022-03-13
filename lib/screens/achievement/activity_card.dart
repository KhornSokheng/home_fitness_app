import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  const ActivityCard({Key? key}) : super(key: key);

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: AssetImage('assets/shoe3.png'),

            height: 500,
            width: 500,
            fit: BoxFit.cover,
            child: InkWell(
              hoverColor: Colors.grey[100]!.withOpacity(0.2),
              onTap: () {},
            ), // InkWell
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Text(
              'Steps',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 50,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
          Positioned(


            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '2350',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'steps',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,

                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
