import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class ChatDetailScreenViewModel extends StreamViewModel {
  Logger log;
  var chat;
  var auth = FirebaseAuth.instance;

  TextEditingController messageEditingController = new TextEditingController();
  QuerySnapshot get tChats => data;

  ChatDetailScreenViewModel(BuildContext context) {
    log = getLogger(this.runtimeType.toString());
    chat = ModalRoute.of(context).settings.arguments;
  }

  Stream<QuerySnapshot> fetchChat() {
    return FirebaseFirestore.instance
        .collection('eventChats')
        .doc(chat['chatId'])
        .collection(chat['chatId'])
        .orderBy('time')
        .snapshots();
  }

  sendMessage() async {
    if (messageEditingController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('eventChats')
          .doc(chat['chatId'])
          .collection(chat['chatId'])
          .doc()
          .set({
        "message": messageEditingController.text,
        "sender": auth.currentUser.displayName,
        'time': DateTime.now().millisecondsSinceEpoch,
        'uid': auth.currentUser.uid
      });

      messageEditingController.clear();
    }
  }

  @override
  // TODO: implement stream
  Stream get stream => fetchChat();
}
