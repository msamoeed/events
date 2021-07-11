import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'chat_detail_screen_view_model.dart';
          
class ChatDetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatDetailScreenViewModel>.reactive(
      builder: (BuildContext context, ChatDetailScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(viewModel.chat['chatName']),
          ),
          body: Center(
            child: Text('ChatDetailScreen View'),
          ),
        );
      },
      viewModelBuilder: () => ChatDetailScreenViewModel(context),
    );
  }
}
