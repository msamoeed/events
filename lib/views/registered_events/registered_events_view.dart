import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'registered_events_view_model.dart';

class RegisteredEventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisteredEventsViewModel>.reactive(
      builder: (BuildContext context, RegisteredEventsViewModel viewModel,
          Widget _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appColor,
            title: Text(
              "Registered Events",
              style: t1white,
            ),
          ),
          body: Center(
            child: ListView(
              children: [
                if (viewModel.dataReady)
                  ...viewModel.tRegistrations.docs.map((e) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Text(
                          e['eventName'],
                          style: t10,
                        ),
                        subtitle: Text(
                          e['docId'],
                          style: t1small.copyWith(color: appColor),
                        ),
                        title: Text(
                          e['eventDate'],
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
      viewModelBuilder: () => RegisteredEventsViewModel(),
    );
  }
}
