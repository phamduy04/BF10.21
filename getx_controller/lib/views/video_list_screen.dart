import 'package:api_lession/controllers/video_list_controller.dart';
import 'package:api_lession/data_sources/api_services.dart';
import 'package:api_lession/models/video_model.dart';
import 'package:api_lession/providers/video_list_provider.dart';
import 'package:api_lession/resources/strings.dart';
import 'package:api_lession/views/home_screen.dart';
import 'package:api_lession/views/second_video_list.dart';
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
  Future<List<VideoModel>>? futureVideoList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        actions: [
          IconButton(
            icon: Icon(Icons.queue_play_next_outlined),
            onPressed: (){
              //Navigator.pop(context);]
              Get.to(()=>SecondVideoList());
              /*
            var route = MaterialPageRoute(builder: (context) => HomeScreen());
            Navigator.pushAndRemoveUntil(context, route, (route)=> false);

             */
            },
          ),

        ]

      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: FutureBuilder<List<VideoModel>>(
          future: futureVideoList,
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

          Get.put(VideoListController()).updateVideoList(videoList: videoList);

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

  loadVideos()
  {
    futureVideoList = ApiServices().fetchVideoList();
  }

}
