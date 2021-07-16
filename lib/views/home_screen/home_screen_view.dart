import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'home_screen_view_model.dart';

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (BuildContext context, HomeScreenViewModel viewModel, Widget _) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              drawer: Drawer(
                elevation: 5,
                semanticLabel: "Profile",
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                          child: Image.network(
                        viewModel.getProfilePicture(),
                        height: 95,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        viewModel.auth.currentUser.displayName,
                        style: t1,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: ListTile(
                        selectedTileColor: Colors.blueGrey,
                        enableFeedback: true,
                        tileColor: appColor,
                        title: Text(
                          "Registrations",
                          style: t1white,
                        ),
                        leading: Icon(
                          Icons.event,
                          color: Colors.white,
                        ),
                        onTap: () {
                          viewModel.navigateToRegisteredEventsScreen();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: ListTile(
                        selectedTileColor: Colors.blueGrey,
                        enableFeedback: true,
                        tileColor: appColor,
                        title: Text(
                          "My Events",
                          style: t1white,
                        ),
                        leading: Icon(
                          Icons.event,
                          color: Colors.white,
                        ),
                        onTap: () {
                          viewModel.navigateToMyEventsScreen();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: ListTile(
                        selectedTileColor: Colors.blueGrey,
                        enableFeedback: true,
                        tileColor: appColor,
                        title: Text(
                          "Bookings",
                          style: t1white,
                        ),
                        leading: Icon(
                          Icons.book_online,
                          color: Colors.white,
                        ),
                        onTap: () => viewModel.navigateToMyBookingsScreen(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: ListTile(
                        selectedTileColor: Colors.blueGrey,
                        enableFeedback: true,
                        tileColor: appColor,
                        title: Text(
                          "Profile",
                          style: t1white,
                        ),
                        leading: Icon(
                          FontAwesomeIcons.userCircle,
                          color: Colors.white,
                        ),
                        onTap: () => viewModel.navigateToProfileScreen(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: ListTile(
                        selectedTileColor: Colors.blueGrey,
                        enableFeedback: true,
                        tileColor: appColor,
                        title: Text(
                          "Logout",
                          style: t1white,
                        ),
                        leading: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        onTap: () => viewModel.logout(),
                      ),
                    ),
                  ],
                ),
              ),
              appBar: AppBar(
                backgroundColor: backgroundcolor,
                bottom: TabBar(isScrollable: true, tabs: [
                  Tab(
                    child: Text('General'),
                  ),
                  Tab(
                    child: Text('Sports'),
                  ),
                ]),
                title: Text(
                  "Events",
                  style: GoogleFonts.montserrat(),
                ),
              ),
              body: TabBarView(children: [
                TabViewWidget(
                  viewModel: viewModel,
                  tStream: viewModel.tGeneral,
                ),
                TabViewWidget(
                  viewModel: viewModel,
                  tStream: viewModel.tSports,
                ),
              ])),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}

class TabViewWidget extends StatelessWidget {
  final HomeScreenViewModel viewModel;
  final QuerySnapshot<Object> tStream;
  const TabViewWidget({
    Key key,
    this.viewModel,
    this.tStream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          if (viewModel.dataReady('general-stream'))
            ...tStream.docs.map((e) {
              return Container(
                margin: EdgeInsets.all(5),
                child: ListTile(
                  leading: Text(
                    e["name"],
                    style: t1white,
                  ),
                  tileColor: backgroundcolor,
                  title: Text(
                    e['date'],
                    style: t1small,
                  ),
                  onTap: () {
                    viewModel.openDialogWithForm(
                        docId: e['docId'],
                        address: e['address'],
                        name: e['name'],
                        context: context,
                        date: e['date'],
                        managerId: e['uid'],
                        time: e['time']);
                  },
                ),
              );
            })
        ],
      ),
    );
  }
}
