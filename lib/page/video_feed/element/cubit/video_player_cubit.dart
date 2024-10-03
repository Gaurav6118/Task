import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itechnolab_task/model/video_model.dart';
import 'package:video_player/video_player.dart';

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit(Video element) :
        super(VideoPlayerState(video: element));

  VideoPlayerController? controller;


  @override
  Future<void> close() {
    controller!.dispose();
    return super.close();
  }


  initializeVideo({String? url}){
    controller = VideoPlayerController.networkUrl(
      Uri.parse(url!),
    )
      ..initialize().then((value){
        emit(state.copyWith());
      });
  }

  isLiked(){
    emit(state.copyWith(isLiked: !state.isLiked!));
  }
}
