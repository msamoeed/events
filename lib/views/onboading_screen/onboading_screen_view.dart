import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'onboading_screen_view_model.dart';
          
class OnboadingScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboadingScreenViewModel>.reactive(
      builder: (BuildContext context, OnboadingScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('OnboadingScreen View'),
          ),
        );
      },
      viewModelBuilder: () => OnboadingScreenViewModel(),
    );
  }
}
