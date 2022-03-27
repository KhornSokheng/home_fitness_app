import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_fitness/models/milestone.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/achievement/color_filters.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class MilestoneCard extends StatefulWidget {
  // const MilestoneCard({Key? key}) : super(key: key);

  Milestone milestone;

  MilestoneCard({Key? key,
    required this.milestone,
  }) : super(key: key);

  @override
  _MilestoneCardState createState() => _MilestoneCardState();
}

class _MilestoneCardState extends State<MilestoneCard> {
  @override
  Widget build(BuildContext context) {

    User user = Provider.of<UserProvider>(context).user;

    if(widget.milestone.name == 'Workouts' && user.num_workout>= widget.milestone.value!){
      widget.milestone.reached = true;
    }else if(widget.milestone.name == 'Minutes' && user.minute_play>= widget.milestone.value!){
      widget.milestone.reached = true;
    }else{
        widget.milestone.reached = false;
    }

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
                image: AssetImage(widget.milestone.image_url),
                colorFilter: widget.milestone.reached ? ColorFilters.identity
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
                widget.milestone.name,
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

                    '${widget.milestone.value}',
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
                    widget.milestone.unit,
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
