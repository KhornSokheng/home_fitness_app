import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/activity.dart';

class ActivityCard extends StatefulWidget {
  // const ActivityCard({Key? key}) : super(key: key);

  Activity activity;

  ActivityCard({
    required this.activity,
  });

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
            image: AssetImage(widget.activity.image_url),

            height: 400,
            width: 400,
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
              widget.activity.name,
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
                  '${widget.activity.value}',
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
                  widget.activity.unit,
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
