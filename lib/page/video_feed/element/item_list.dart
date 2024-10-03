import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itechnolab_task/help/app_config.dart';
import 'package:itechnolab_task/help/route_arugument.dart';
import 'package:itechnolab_task/page/video_feed/element/cubit/video_player_cubit.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, this.index});

  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // Navigate to video player on tap
            Navigator.of(context).pushNamed('/VideoPlayerScreen',
                arguments: RouteArguments(video: state.video));
          },
          child: Card(
            elevation: 2,
            color: Colors.white,
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: state.video!.image!,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: Text('Username: ${state.video!.user} ${index! + 1}'),
              subtitle: Text('Likes: ${state.video!.likes}'),
              trailing: InkWell(
                onTap: () {
                  context.read<VideoPlayerCubit>().isLiked();
                },
                child: Image.asset(
                  state.isLiked!
                      ? 'assets/img/heart.png'
                      : 'assets/img/unFill.png',
                  height: AppConfig(context).appHeight(3),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
