import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'bookings_view_model.dart';

class BookingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingsViewModel>.reactive(
      builder: (BuildContext context, BookingsViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
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
                          e['uid'],
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
      viewModelBuilder: () => BookingsViewModel(),
    );
  }
}
