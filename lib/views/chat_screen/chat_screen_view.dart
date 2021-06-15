import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'chat_screen_view_model.dart';
          
class ChatScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatScreenViewModel>.reactive(
      builder: (BuildContext context, ChatScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('ChatScreen View'),
          ),
        );
      },
      viewModelBuilder: () => ChatScreenViewModel(),
    );
  }
}
