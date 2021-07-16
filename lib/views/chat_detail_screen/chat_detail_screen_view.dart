import 'package:events/constants/fonts.dart';
import 'package:events/widgets/dumb_widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'chat_detail_screen_view_model.dart';

class ChatDetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatDetailScreenViewModel>.reactive(
      builder: (BuildContext context, ChatDetailScreenViewModel viewModel,
          Widget _) {
        return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.chat['chatName']),
            ),
            body: Container(
                child: Stack(children: [
              Center(
                child: ListView(
                  children: [
                    if (viewModel.dataReady)
                      ...viewModel.tChats.docs.map((e) {
                        return MessageTile(
                          message: e['message'],
                          sender: e['sender'],
                          sentByMe: e['uid'] == viewModel.auth.currentUser.uid,
                        );
                      })
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  color: Colors.grey[700],
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: viewModel.messageEditingController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Send a message ...",
                              hintStyle: TextStyle(
                                color: Colors.white38,
                                fontSize: 16,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      GestureDetector(
                        onTap: () {
                          viewModel.sendMessage();
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Icon(Icons.send, color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ])));
      },
      viewModelBuilder: () => ChatDetailScreenViewModel(context),
    );
  }
}
