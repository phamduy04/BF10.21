import 'package:api_lession/data_sources/api_urls.dart';
import 'package:api_lession/models/video_model.dart';
import 'package:api_lession/resources/utils/logs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServices {

  Future<List<VideoModel>> fetchVideoList() async {
    List<VideoModel> videoList = [];
    var videoListUrl = ApiUrl.VIDEO_URL;
    var response;
    try{
      response = await http.get(videoListUrl) ;
    }
    catch(e){
      print("ERROR VIDEO LOADING "+ e.toString());
    }
    var jsonBody = json.jsonDecode(response.body);
    Log().printJson(json: jsonBody);

    if(jsonBody['code']=="success")
      {
        List jsonList = jsonBody['list'];
        for(var json in jsonList){
          VideoModel videoModel = VideoModel.fromJson(json);
          videoList.add(videoModel);
        }
      }
    return videoList;
  }

}