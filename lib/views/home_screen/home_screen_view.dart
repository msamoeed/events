import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:flutter/material.dart';
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
              appBar: AppBar(
                automaticallyImplyLeading: false,
                
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
    return ListView(
      children: [
        if (viewModel.dataReady('general-stream'))
          ...tStream.docs.map((e) {
            return Container(
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading:  Text(
                  e["name"] ,
                  style: t1,
                ),
                tileColor: widgetcolor,
                title: Text(
                  e['date'],
                  style: t1small,
                ),
                subtitle: Text(
                  e['type'],
                  style: t1,
                ),
                trailing: Text(
                  e['address'],
                  style: t1,
                ),
              ),
            );
          })
      ],
    );
  }
}
