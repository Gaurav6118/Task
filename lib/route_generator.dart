import 'package:flutter/material.dart';
import 'package:itechnolab_task/help/route_arugument.dart';
import 'package:itechnolab_task/page/splash.dart';
import 'package:itechnolab_task/page/video_feed/video_feed_screen.dart';
import 'package:itechnolab_task/page/video_player/video_player_screen.dart';

// This class is using for set route
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    debugPrint(settings.name.toString());
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute<void>(builder: (_) => const SplashPage());

      case '/VideoFeedScreen':
        return VideoFeedScreen.route();

      case '/VideoPlayerScreen':
        return VideoPlayerScreen.route(routeArguments: args as RouteArguments);


      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute<void>(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}
