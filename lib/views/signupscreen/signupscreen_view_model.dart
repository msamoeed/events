import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class SignupscreenViewModel extends BaseViewModel {
  Logger log;

  SignupscreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
