import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itechnolab_task/help/app_config.dart';
import 'package:itechnolab_task/help/route_arugument.dart';
import 'package:itechnolab_task/page/video_feed/element/cubit/video_player_cubit.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, this.routeArguments});

  final RouteArguments? routeArguments;

  static Route route({RouteArguments? routeArguments}) {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => VideoPlayerCubit(routeArguments!.video!),
              child: VideoPlayerScreen(routeArguments: routeArguments),
            ));
  }

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    context
        .read<VideoPlayerCubit>()
        .initializeVideo(url: widget.routeArguments!.video!.videoLink!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = context.read<VideoPlayerCubit>().controller!;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          controller.dispose();
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
          return;
        }
      },
      child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    controller.dispose();
                    Navigator.of(context).pop();
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitDown,
                      DeviceOrientation.portraitUp
                    ]);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: const Text('Video Player'),
            ),
            body: Column(
              children: [
                // Fixed size container for the video player
                Container(
                  height: AppConfig(context).appHeight(43),
                  // Set the desired height
                  width: AppConfig(context).appWidth(100),
                  // Set the desired width
                  color: Colors.black,
                  // Background color for the video
                  child: FittedBox(
                    fit: BoxFit.fitWidth, // Maintains aspect ratio
                    child: SizedBox(
                      width: controller.value.size.width,
                      height: controller.value.size.height,
                      child: VideoPlayer(controller),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.only(top: AppConfig(context).appHeight(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow),
                        onPressed: () {
                          setState(() {
                            controller.value.isPlaying
                                ? controller.pause()
                                : controller.play();
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(state.isLiked!
                            ? Icons.thumb_up
                            : Icons.thumb_up_alt_outlined),
                        onPressed: () {
                          context.read<VideoPlayerCubit>().isLiked();
                        },
                      ),
                    ],
                  ),
                ),
                VideoProgressIndicator(
                  controller,
                  allowScrubbing: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
