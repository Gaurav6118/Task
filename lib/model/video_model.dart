class VideoModel {
  List<Video>? video;

  VideoModel({this.video});

  VideoModel.fromJson(Map<String, dynamic> json) {
    if (json['video'] != null) {
      video = <Video>[];
      json['video'].forEach((v) {
        video!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (video != null) {
      data['video'] = video!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video {
  String? user;
  String? videoLink;
  bool? isLike;
  String? likes;
  String? image;

  Video({this.user, this.videoLink, this.isLike, this.likes, this.image});

  Video.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    videoLink = json['videoLink'];
    isLike = json['isLike'];
    likes = json['likes'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['videoLink'] = videoLink;
    data['isLike'] = isLike;
    data['likes'] = likes;
    data['image'] = image;
    return data;
  }
}
