import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/classes/time_date.dart';
import 'package:events/core/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class EventFormViewModel extends BaseViewModel {
  Logger log;

  DateTime startdate = (DateTime.now());
  TimeOfDay starttime = (TimeOfDay.now());
  var name;
  var type;
  var address;
  final _snackbarService = locator<SnackbarService>();
  final _navService = locator<NavigationService>();

  var auth = FirebaseAuth.instance;

  setSelectedDate({selectedDate}) {
    startdate = selectedDate;
    notifyListeners();
  }

  setSelectedTime({selectedTime}) {
    starttime = selectedTime;
    notifyListeners();
  }

  Future submitForm() async {
    if (name != null && type != null && address != null) {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('events').doc();
      await FirebaseFirestore.instance
          .collection('events')
          .doc(documentReference.id)
          .set({
            "time":
                starttime.hour.toString() + ':' + startdate.minute.toString(),
            "date": DateMonthYear(startdate),
            "type": type,
            "name": name,
            'uid': auth.currentUser.uid,
            "docId": documentReference.id,
            "address": address
          })
          .then((value) => {
                _snackbarService.showSnackbar(
                  message: "Event successfully registered",
                ),
              })
          .catchError((err) {
            _snackbarService.showSnackbar(
                message: err.message.toString(), title: "Error");
          });
    } else {
      _snackbarService.showSnackbar(
          message: "Fields can not be empty ", title: "Error");
    }
  }

  Future<DateTime> selectedDateTimeStart(BuildContext context) =>
      showDatePicker(
          context: context,
          initialDate: DateTime(2020),
          firstDate: DateTime(2020),
          lastDate: DateTime(2099));

  Future<TimeOfDay> selectedTimeStart(BuildContext context) =>
      showTimePicker(context: context, initialTime: TimeOfDay.now());

  EventFormViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
