import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'chat_screen_view_model.dart';

class ChatScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatScreenViewModel>.reactive(
      builder: (BuildContext context, ChatScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Chats",
              style: t1white,
            ),
            backgroundColor: appColor,
          ),
          body: Center(
            child: ListView(
              children: [
                if (viewModel.dataReady)
                  ...viewModel.tRegistrations.docs.map((e) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            leading: CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.blueAccent,
                                child: Text(
                                    e['eventName']
                                        .substring(0, 1)
                                        .toUpperCase(),
                                    style: TextStyle(color: Colors.white))),
                            title: Text(
                              e['eventName'],
                              style: t10.copyWith(fontWeight: FontWeight.w700),
                            ),
                            subtitle: Text("Tap to join chat"),
                          ),
                        ),
                        Divider(
                          color: appColor,
                          thickness: 1,
                        )
                      ],
                    );
                  })
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ChatScreenViewModel(),
    );
  }
}
