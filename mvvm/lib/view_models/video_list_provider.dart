import 'package:api_lession/data_sources/api_services.dart';
import 'package:api_lession/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoListProvider with ChangeNotifier {

  List<VideoModel> videoList = [];

  getVideoList() async {
    this.videoList = await ApiServices().fetchVideoList();
  }

}