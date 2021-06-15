import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'signupscreen_view_model.dart';
          
class SignupscreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupscreenViewModel>.reactive(
      builder: (BuildContext context, SignupscreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('Signupscreen View'),
          ),
        );
      },
      viewModelBuilder: () => SignupscreenViewModel(),
    );
  }
}
