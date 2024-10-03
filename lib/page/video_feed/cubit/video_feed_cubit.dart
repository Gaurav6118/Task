import 'dart:convert'; // To convert JSON to Dart object

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itechnolab_task/model/video_model.dart';
import 'package:itechnolab_task/page/video_feed/element/cubit/video_player_cubit.dart';

part 'video_feed_state.dart';

class VideoFeedCubit extends Cubit<VideoFeedState> {
  VideoFeedCubit() : super(const VideoFeedState()) {
    loadVideoList();
  }

  loadVideoList() async {
    // Load the json file from assets
    String jsonString =
        await rootBundle.loadString('assets/config/video_list.json');

    // Decode the JSON string into a Map
    final jsonResponse = json.decode(jsonString);

    // Parse the JSON map into the VideoList model
    VideoModel videoModel = VideoModel.fromJson(jsonResponse);

    List<VideoPlayerCubit> cubit = [];

    for (var element in videoModel.video!) {
      cubit.add(VideoPlayerCubit(element));
    }

    emit(state.copyWith(
        videoList: videoModel.video, videoPlayerCubitList: cubit));
  }
}
