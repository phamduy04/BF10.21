import 'package:api_lession/data_sources/api_services.dart';
import 'package:api_lession/models/video_model.dart';
import 'package:api_lession/resources/strings.dart';
import 'package:api_lession/view_models/video_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VideoListProvider>(context, listen: false).getVideoList();
  }

  @override
  Widget build(BuildContext context) {
    final videoListProvider = Provider.of<VideoListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: videoListProvider.videoList.length != 0 ?
        GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
        itemCount: videoListProvider.videoList.length,
        itemBuilder: (BuildContext context, int index) {
          VideoModel videoModel = videoListProvider.videoList[index];
          return Card(
              color: Colors.white,
              child: Column(
                children: [
                  Image.network(videoModel.url_photo!),
                  Text(videoModel.title!)
                ],
              )
          );
        }
    ): Center(
       child: CircularProgressIndicator()
    )
      ),
    );
  }

}
