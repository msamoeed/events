// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:events/core/router_constants.dart';

import 'package:events/views/splashscreen/splashscreen_view.dart' as view0;
import 'package:events/views/onboading_screen/onboading_screen_view.dart' as view1;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreenViewRoute:
        return MaterialPageRoute(builder: (_) => view0.SplashscreenView());
      case onboadingScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view1.OnboadingScreenView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}