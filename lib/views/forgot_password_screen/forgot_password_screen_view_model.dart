import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class ForgotPasswordScreenViewModel extends BaseViewModel {
  Logger log;

  ForgotPasswordScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
