import 'package:flutter/material.dart';
import 'package:home_fitness/models/activity.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:home_fitness/screens/achievement/color_filters.dart';

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
    return Flexible(
      child: Card(
        shadowColor: Colors.orange,
        elevation: 8,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              
              aspectRatio: 4/3,
              child: Ink.image(
                image: AssetImage(widget.activity.image_url),
                colorFilter: widget.activity.reached ? ColorFilters.identity
                            : ColorFilters.greyscale,

                // height: 500,
                // width: 500,
                // fit: BoxFit.cover,
                fit: BoxFit.fill,
                child: InkWell(
                  hoverColor: Colors.grey[100]!.withOpacity(0.5),
                  onTap: () {},
                ), // InkWell
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              right: 5,
              child: AutoSizeText(
                widget.activity.name,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Positioned(


              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(

                    '${widget.activity.value}',
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AutoSizeText(
                    widget.activity.unit,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,

                    ),
                  ),
                ],
              ),
            ),

            // Positioned(
            //   // left: 10,
            //   // top: 10,
            //   right: 5,
            //   bottom: 5,
            //   child: Icon(
            //     FontAwesomeIcons.heartbeat,
            //     size: 170,
            //     color: Colors.orange,
            //
            //   )
            // ),

          ],
        ),
      ),
    );
  }
}
