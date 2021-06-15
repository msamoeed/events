import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'event_selection_screen_view_model.dart';
          
class EventSelectionScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventSelectionScreenViewModel>.reactive(
      builder: (BuildContext context, EventSelectionScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('EventSelectionScreen View'),
          ),
        );
      },
      viewModelBuilder: () => EventSelectionScreenViewModel(),
    );
  }
}
