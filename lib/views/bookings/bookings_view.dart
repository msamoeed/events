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
          appBar: AppBar(
            title: Text(
              "Bookings",
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
                      child: Column(
                        children: [
                          ListTile(
                            trailing: Text(
                              e['contactNumber'],
                              style: t1small.copyWith(color: Colors.blueAccent),
                            ),
                            leading: Text(
                              e['eventName'],
                              style: t10,
                            ),
                            subtitle: Text(
                              e['uid'],
                              style: t1small.copyWith(color: appColor),
                            ),
                            title: Text(
                              e['userName'],
                              style: t10,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: appColor,
                          )
                        ],
                      ),
                    );
                  }),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => BookingsViewModel(),
    );
  }
}
