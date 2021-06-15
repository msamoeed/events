import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class EventSelectionScreenViewModel extends BaseViewModel {
  Logger log;

  EventSelectionScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
