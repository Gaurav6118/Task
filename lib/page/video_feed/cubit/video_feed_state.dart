part of 'video_feed_cubit.dart';

class VideoFeedState extends Equatable {
  const VideoFeedState({
    this.videoList = const [],
    this.videoPlayerCubitList = const [],
  });

  final List<Video>? videoList;
  final List<VideoPlayerCubit>? videoPlayerCubitList;

  VideoFeedState copyWith({
    List<Video>? videoList,
    List<VideoPlayerCubit>? videoPlayerCubitList,
  }) {
    return VideoFeedState(
      videoList: videoList ?? this.videoList,
      videoPlayerCubitList: videoPlayerCubitList ?? this.videoPlayerCubitList,
    );
  }

  @override
  List<Object?> get props => [videoList, videoPlayerCubitList];
}
