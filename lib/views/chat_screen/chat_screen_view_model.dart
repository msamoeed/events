import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/core/locator.dart';
import 'package:events/views/chat_detail_screen/chat_detail_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatScreenViewModel extends StreamViewModel {
  Logger log;

  var _auth = FirebaseAuth.instance;
  final _navService = locator<NavigationService>();
  QuerySnapshot get tRegistrations => data;

  Stream<QuerySnapshot> fetchRegistrations() {
    return FirebaseFirestore.instance
        .collection('eventsRegistration')
        .where('uid', isEqualTo: _auth.currentUser.uid)
        .snapshots();
  }

  navigateToChatDetail({String chatId, String chatName}) {
    _navService.navigateToView(ChatDetailScreenView(),
        arguments: {'chatId': chatId, 'chatName': chatName});
  }

  @override
  Stream get stream => fetchRegistrations();

  ChatScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
