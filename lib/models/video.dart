// import 'dart:math';

class Video{
  String title;
  String type; // the workout type like For You, New, Trend...
  String level;
  int numView;
  int duration; //duration in minute
  String thumbnailImageUrl;
  String description;


  Video({
    required this.title,
    required this.level,
    required this.type,
    required this.duration,
    // this.num_view = Random().nextInt(2000)+2000;
    this.numView = 786,
    this.thumbnailImageUrl = 'assets/default_thumbnail.jpg',
    this.description = 'Best for your muscle',



  });

}