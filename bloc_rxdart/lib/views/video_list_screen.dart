import 'package:api_lession/blocs/video_list_bloc.dart';
import 'package:api_lession/data_sources/api_services.dart';
import 'package:api_lession/models/video_model.dart';
import 'package:api_lession/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  final videoListBloc = VideoListBloc();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoListBloc.putVideoListIntoBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: StreamBuilder<List<VideoModel>>(
          stream: videoListBloc.videoListStream,
            builder: (context, snapshot)
        {
          if(snapshot.hasError)
            return Center(
             child: Text("Load dữ liệu lỗi"),
          );
          if(!snapshot.hasData) return
            Center(
            child: CircularProgressIndicator()
          );
          List<VideoModel> videoList = snapshot.data!;
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: videoList.length,
              itemBuilder: (BuildContext context, int index) {
                VideoModel videoModel = videoList[index];
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
          );

        }),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoListBloc.dispose();
  }

}
