import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class EventFormViewModel extends BaseViewModel {
  Logger log;

  EventFormViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
