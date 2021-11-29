import 'package:api_lession/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoListProvider with ChangeNotifier {
   List<VideoModel> videoList = [];

   updateVideoList({  required List<VideoModel> videoList })
   {
     this.videoList = videoList;
     print("Độ dài dữ liệu trên Provider: " + this.videoList.length.toString());
    // notifyListeners();
   }

}