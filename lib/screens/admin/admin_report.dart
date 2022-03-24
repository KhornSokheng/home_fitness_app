import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/activity.dart';
import 'package:home_fitness/models/milestone.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/models/video.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/achievement/activity_card.dart';
import 'package:home_fitness/screens/achievement/milestone_card.dart';
import 'package:provider/provider.dart';

import '../../providers/video_provider.dart';
import 'add_video.dart';

class AdminReport extends StatefulWidget {
  const AdminReport({Key? key}) : super(key: key);

  @override
  _AdminReportState createState() => _AdminReportState();
}

class _AdminReportState extends State<AdminReport> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    // user.generateData(); //generate some data for activities

    user.getUser();

    List<Video> all_videos = Provider.of<VideoProvider>(context).all_videos;

    // the admin report card extends from the activity card in achievement

    List<Activity> activityList = [
      Activity(
          name: 'Workout Videos',
          unit: 'videos',
          value: '${all_videos.length}',
          image_url: 'assets/admin_report.png'),
      Activity(
          name: 'Users',
          unit: 'users',
          value: '98,500',
          image_url: 'assets/admin_report.png'),
      Activity(
        name: 'Profit', unit: '\$', value: '89,099',
        image_url: 'assets/admin_report.png',
        // reached: false
      ),
      Activity(
        name: 'Expenses', unit: '\$', value: '525',
        image_url: 'assets/admin_report.png',
        // reached: false
      ),
    ];

    Future insertNewVideo({required Video new_video})async{
      /// Reference to document
      final docVideo = FirebaseFirestore.instance.collection('videos').doc() ;



      /// Create document and write data to Firebase
      await docVideo.set(new_video.toJson());
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Admin Reports"),
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
                'Reports',
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
                  return ActivityCard(
                    activity: activityList[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 5,
                  );
                },
                itemCount: activityList.length,
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // future???
                  final Video? new_video = await showDialog<Video>(
                    context: context,
                    builder: (BuildContext context) => AddVideo(),
                  );
                  if (new_video == null ||
                      new_video.title.isEmpty ||
                      new_video.releaseDate == null) return;

                  setState(() {

                    // TODO
                    // insert to collection 'videos'
                    insertNewVideo(new_video: new_video);

                    all_videos.add(new_video);
                  });
                },
                child: Text(
                  'Add Video',
                ),
              ),
            ),

          ],
        ),
      ),
    );

    

  }
}
