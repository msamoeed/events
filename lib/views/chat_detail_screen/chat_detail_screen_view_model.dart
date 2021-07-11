import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class ChatDetailScreenViewModel extends StreamViewModel {
  Logger log;
  var chat;
    TextEditingController messageEditingController = new TextEditingController();

  ChatDetailScreenViewModel(BuildContext context) {
    log = getLogger(this.runtimeType.toString());
    chat = ModalRoute.of(context).settings.arguments;

  }

  @override
  // TODO: implement stream
  Stream get stream => throw UnimplementedError();
}
