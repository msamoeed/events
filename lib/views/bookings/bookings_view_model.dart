import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class BookingsViewModel extends StreamViewModel {
  Logger log;
  var _auth = FirebaseAuth.instance;
  QuerySnapshot get tRegistrations => data;

  BookingsViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  Stream<QuerySnapshot> fetchRegistrations() {
    return FirebaseFirestore.instance
        .collection('eventsRegistration')
        .where('managerId', isEqualTo: _auth.currentUser.uid)
        .snapshots();
  }

  @override
  // TODO: implement stream
  Stream get stream => fetchRegistrations();
}
