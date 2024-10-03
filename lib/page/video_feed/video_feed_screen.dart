import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itechnolab_task/help/app_config.dart' as config;
import 'package:itechnolab_task/page/video_feed/cubit/video_feed_cubit.dart';
import 'package:itechnolab_task/page/video_feed/element/item_list.dart';

class VideoFeedScreen extends StatelessWidget {
  const VideoFeedScreen({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const VideoFeedScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoFeedCubit, VideoFeedState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: config.AppColors().accentColor(1),
          appBar: AppBar(
            leading: const SizedBox(),
            centerTitle: true,
            title: const Text('Video Feed'),
          ),
          body: ListView.separated(
            itemCount: state.videoPlayerCubitList!.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(config.AppConfig(context).appHeight(1)),
            separatorBuilder: (c, i) {
              return SizedBox(
                height: config.AppConfig(context).appHeight(1.5),
              );
            },
            itemBuilder: (context, index) {
              return BlocProvider.value(
                value: state.videoPlayerCubitList![index],
                child: ItemList(index: index),
              );
            },
          ),
        );
      },
    );
  }
}
