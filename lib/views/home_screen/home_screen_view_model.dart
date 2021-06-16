import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/core/locator.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

const String _GeneralStreamKey = 'general-stream';
const String _SportsStreamKey = 'sports-stream';

class HomeScreenViewModel extends MultipleStreamViewModel {
  Logger log;
  var firebase = FirebaseFirestore.instance;

  // var _navService = locator<NavigationService>();

  Stream<QuerySnapshot> getGeneralEvents() {
 

    return firebase
        .collection('events')
        .where('type', isEqualTo: 'general')
        .snapshots();
  }

  Stream<QuerySnapshot> getSportsEvents() {
    return firebase
        .collection('events')
        .where('type', isEqualTo: 'sports')
        .snapshots();
  }

  QuerySnapshot get tGeneral => dataMap[_GeneralStreamKey];
  QuerySnapshot get tSports => dataMap[_SportsStreamKey];

  @override
  Map<String, StreamData> get streamsMap => {
        _GeneralStreamKey: StreamData<QuerySnapshot>(getGeneralEvents()),
        _SportsStreamKey: StreamData<QuerySnapshot>(getSportsEvents()),
      };

  HomeScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
