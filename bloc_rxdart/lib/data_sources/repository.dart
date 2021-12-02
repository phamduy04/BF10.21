
import 'package:api_lession/data_sources/api_services.dart';
import 'package:api_lession/models/video_model.dart';

class Repository {
  final ApiServices _apiServices = ApiServices();
  Future<List<VideoModel>> fetchAllVideos()=> _apiServices.fetchVideoList();


}