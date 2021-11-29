import 'package:api_lession/models/video_model.dart';
import 'package:api_lession/providers/video_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoTitleList extends StatelessWidget {
  const VideoTitleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //VideoListProvider videoListProvider =  Provider.of<VideoListProvider>(context);
    //List<VideoModel> videoList = videoListProvider.videoList;
    //List<VideoModel> videoList = context.watch<VideoListProvider>().videoList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách video"),
        centerTitle: true,
      ),
      body: Container(
        child: Consumer<VideoListProvider>(
          builder: (context, videoListProvider, child)
          {
            List<VideoModel> videoList = videoListProvider.videoList;
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
          },
        ),
      ),
    );
  }
}
