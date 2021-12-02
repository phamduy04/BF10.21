import 'package:api_lession/data_sources/repository.dart';
import 'package:api_lession/models/video_model.dart';
import 'package:rxdart/rxdart.dart';

class VideoListBloc {
  final _repository = Repository();

  final videoListSubject = PublishSubject<List<VideoModel>>();

  // put data to bloc
putVideoListIntoBloc() async {
  List<VideoModel> videoList = await _repository.fetchAllVideos();
  videoListSubject.sink.add(videoList);
}

// push Data Stream to View
Stream<List<VideoModel>> get videoListStream => videoListSubject.stream ;

dispose(){
  videoListSubject.close();
}

}