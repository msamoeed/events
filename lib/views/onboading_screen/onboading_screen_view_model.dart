import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class OnboadingScreenViewModel extends BaseViewModel {
  Logger log;

  OnboadingScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
