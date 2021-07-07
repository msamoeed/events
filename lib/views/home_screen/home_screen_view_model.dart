import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:events/core/locator.dart';
import 'package:events/views/bookings/bookings_view.dart';
import 'package:events/views/loginscreen/loginscreen_view.dart';
import 'package:events/views/my_events/my_events_view.dart';
import 'package:events/views/registered_events/registered_events_view.dart';
import 'package:events/widgets/dumb_widgets/header_curved.dart';
import 'package:events/widgets/dumb_widgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

const String _GeneralStreamKey = 'general-stream';
const String _SportsStreamKey = 'sports-stream';

class HomeScreenViewModel extends MultipleStreamViewModel {
  Logger log;
  var firebase = FirebaseFirestore.instance;
  var contactNumber;
  var dialogService = locator<DialogService>();
  final _navService = locator<NavigationService>();

  var auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> getGeneralEvents() {
    return firebase
        .collection('events')
        .where('type', isEqualTo: 'general')
        .snapshots();
  }

  final _snackbarService = locator<SnackbarService>();

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

  openDialogWithForm(
      {String name,
      String address,
      String time,
      String date,
      String docId,
      String managerId,
      context}) {
    showGeneralDialog(
      barrierLabel: "QR Code",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: backgroundcolor,
            child: Container(
              height: 350,
              child: Center(
                  child: ListView(
                children: [
                  HomeHeader(
                    title: name,
                  ),
                  ListTile(
                    leading: Text(
                      address,
                      style: t1white,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      date,
                      style: t1white,
                    ),
                    trailing: Text(
                      time,
                      style: t1white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5),
                    child: TextFields(
                      icon: Tab(
                        icon: Icon(Icons.phone_android_outlined),
                      ),
                      hintText: "Contact Number (Optional)",
                      context: context,
                      secureText: false,
                      borderColor: backgroundcolor,
                      focusColor: appColor,
                      onChanged: (String a) {
                        contactNumber = a;
                      },
                    ),
                  ),
                  TextButton.icon(
                      onPressed: () {
                        createBooking(
                            eventId: docId,
                            eventName: name,
                            eventDate: date,
                            managerId: managerId);
                      },
                      icon: Icon(
                        FontAwesomeIcons.forward,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Participate",
                        style: t1white,
                      ))
                ],
              )),
              margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              decoration: BoxDecoration(
                color: backgroundcolor,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  navigateToRegisteredEventsScreen() {
    _navService.navigateToView(RegisteredEventsView());
  }

  navigateToMyEventsScreen() {
    _navService.navigateToView(MyEventsView());
  }

  navigateToMyBookingsScreen() {
    _navService.navigateToView(BookingsView());
  }

  logout() {
    auth.signOut();
    _navService.clearTillFirstAndShowView(LoginscreenView());
  }

  createBooking(
      {String eventId, String eventName, eventDate, managerId}) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('eventsRegistration').doc();
    await FirebaseFirestore.instance
        .collection('eventsRegistration')
        .doc(documentReference.id)
        .set({
          'uid': auth.currentUser.uid,
          "docId": documentReference.id,
          "eventId": eventId,
          "eventName": eventName,
          "eventDate": eventDate,
          "contactNumber": contactNumber,
          "managerId": managerId
        })
        .then((value) => {
              _snackbarService.showSnackbar(
                message: "Event successfully booked",
              ),
            })
        .catchError((err) {
          _snackbarService.showSnackbar(
              message: err.message.toString(), title: "Error");
        });
  }

  HomeScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
