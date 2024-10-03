part of 'video_player_cubit.dart';

class VideoPlayerState extends Equatable {
  const VideoPlayerState({
    // this.status = FormzStatus.pure,
    this.video,
    this.isLiked = false,
  });

  // final FormzStatus status;
  final Video? video;
  final bool? isLiked;

  VideoPlayerState copyWith({
    // FormzStatus? status,
    Video? video,
    bool? isLiked,
  }) {
    return VideoPlayerState(
      // status: status ?? this.status,
      video: video ?? this.video,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object?> get props => [/*status,*/ video, isLiked];
}
