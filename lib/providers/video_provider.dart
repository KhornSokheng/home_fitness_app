import 'package:flutter/cupertino.dart';

import '../models/video.dart';

class VideoProvider extends ChangeNotifier {
  List<Video> all_videos =[];


  // VideoProvider({required this.all_videos});

  void updateVideos(List<Video> newVideos){
    this.all_videos = newVideos;
    notifyListeners();
  }
}
