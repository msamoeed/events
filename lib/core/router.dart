// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:events/core/router_constants.dart';

import 'package:events/views/splashscreen/splashscreen_view.dart' as view0;
import 'package:events/views/onboading_screen/onboading_screen_view.dart' as view1;
import 'package:events/views/loginscreen/loginscreen_view.dart' as view2;
import 'package:events/views/signupscreen/signupscreen_view.dart' as view3;
import 'package:events/views/forgot_password_screen/forgot_password_screen_view.dart' as view4;
import 'package:events/views/bottom_bar/bottom_bar_view.dart' as view5;
import 'package:events/views/home_screen/home_screen_view.dart' as view6;
import 'package:events/views/chat_screen/chat_screen_view.dart' as view7;
import 'package:events/views/event_selection_screen/event_selection_screen_view.dart' as view8;
import 'package:events/views/event_form/event_form_view.dart' as view9;
import 'package:events/views/registered_events/registered_events_view.dart' as view10;
import 'package:events/views/my_events/my_events_view.dart' as view11;
import 'package:events/views/bookings/bookings_view.dart' as view12;
import 'package:events/views/chat_detail_screen/chat_detail_screen_view.dart' as view13;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreenViewRoute:
        return MaterialPageRoute(builder: (_) => view0.SplashscreenView());
      case onboadingScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view1.OnboadingScreenView());
      case loginscreenViewRoute:
        return MaterialPageRoute(builder: (_) => view2.LoginscreenView());
      case signupscreenViewRoute:
        return MaterialPageRoute(builder: (_) => view3.SignupscreenView());
      case forgotPasswordScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view4.ForgotPasswordScreenView());
      case bottomBarViewRoute:
        return MaterialPageRoute(builder: (_) => view5.BottomBarView());
      case homeScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view6.HomeScreenView());
      case chatScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view7.ChatScreenView());
      case eventSelectionScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view8.EventSelectionScreenView());
      case eventFormViewRoute:
        return MaterialPageRoute(builder: (_) => view9.EventFormView());
      case registeredEventsViewRoute:
        return MaterialPageRoute(builder: (_) => view10.RegisteredEventsView());
      case myEventsViewRoute:
        return MaterialPageRoute(builder: (_) => view11.MyEventsView());
      case bookingsViewRoute:
        return MaterialPageRoute(builder: (_) => view12.BookingsView());
      case chatDetailScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view13.ChatDetailScreenView());
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