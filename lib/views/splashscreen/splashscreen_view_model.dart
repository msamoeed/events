import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class SplashscreenViewModel extends BaseViewModel {
  Logger log;

  SplashscreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
