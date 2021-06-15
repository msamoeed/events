import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class HomeScreenViewModel extends BaseViewModel {
  Logger log;

  HomeScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
