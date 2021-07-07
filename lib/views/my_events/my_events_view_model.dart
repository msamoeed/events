import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class MyEventsViewModel extends StreamViewModel {
  Logger log;
  var _auth = FirebaseAuth.instance;
  QuerySnapshot get tEvents => data;

  MyEventsViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  Stream<QuerySnapshot> fetchMyEvents() {
    return FirebaseFirestore.instance
        .collection('events')
        .where('uid', isEqualTo: _auth.currentUser.uid)
        .snapshots();
  }

  @override
  // TODO: implement stream
  Stream get stream => fetchMyEvents();
}
