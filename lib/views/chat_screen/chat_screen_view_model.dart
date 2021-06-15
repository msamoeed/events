import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';

class ChatScreenViewModel extends BaseViewModel {
  Logger log;

  ChatScreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
