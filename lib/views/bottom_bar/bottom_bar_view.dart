import 'package:events/constants/colors.dart';
import 'package:events/views/chat_screen/chat_screen_view.dart';
import 'package:events/views/event_form/event_form_view.dart';
import 'package:events/views/home_screen/home_screen_view.dart';
import 'package:events/views/registered_events/registered_events_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'bottom_bar_view_model.dart';

class BottomBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarViewModel>.reactive(
      builder: (BuildContext context, BottomBarViewModel viewModel, Widget _) {
        return Scaffold(
            appBar: AppBar(),
            body: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: GoogleFonts.rubik(),
              selectedItemColor: Colors.white,

              unselectedIconTheme: IconThemeData(color: Colors.grey),
              elevation: 10,
              backgroundColor: widgetcolor,
              onTap: viewModel.setIndex, // new
              currentIndex: viewModel.currentIndex, // new
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.home,
                      size: 25,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.solidStickyNote,
                      size: 25,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      size: 25,
                    ),
                    label: ""),
              ],
            ));
      },
      viewModelBuilder: () => BottomBarViewModel(),
    );
  }
}

Widget getViewForIndex(int index, bool isCustomer) {
  if (index == 0) {
    return HomeScreenView();
  } else if (index == 1) {
    return EventFormView();
  } else if (index == 2) {
    return ChatScreenView();
  } else if (index == 3) {
    return RegisteredEventsView();
  } else {
    return HomeScreenView();
  }
}
