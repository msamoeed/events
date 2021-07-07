import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'my_events_view_model.dart';

class MyEventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyEventsViewModel>.reactive(
      builder: (BuildContext context, MyEventsViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appColor,
          ),
          body: Center(
            child: ListView(
              children: [
                if (viewModel.dataReady)
                  ...viewModel.tEvents.docs.map((e) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Text(
                          e['name'],
                          style: t10,
                        ),
                        subtitle: Text(
                          e['address'],
                          style: t1small.copyWith(color: appColor),
                        ),
                        title: Text(
                          e['date'],
                          style: t10,
                        ),
                      ),
                    );
                  })
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => MyEventsViewModel(),
    );
  }
}
