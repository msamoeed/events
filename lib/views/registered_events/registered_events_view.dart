import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'registered_events_view_model.dart';
          
class RegisteredEventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisteredEventsViewModel>.reactive(
      builder: (BuildContext context, RegisteredEventsViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('RegisteredEvents View'),
          ),
        );
      },
      viewModelBuilder: () => RegisteredEventsViewModel(),
    );
  }
}
