import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class RegisteredEventsViewModel extends BaseViewModel {
  Logger log;

  RegisteredEventsViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
