import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'event_form_view_model.dart';
          
class EventFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventFormViewModel>.reactive(
      builder: (BuildContext context, EventFormViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('EventForm View'),
          ),
        );
      },
      viewModelBuilder: () => EventFormViewModel(),
    );
  }
}
