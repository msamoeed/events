import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'forgot_password_screen_view_model.dart';
          
class ForgotPasswordScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordScreenViewModel>.reactive(
      builder: (BuildContext context, ForgotPasswordScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('ForgotPasswordScreen View'),
          ),
        );
      },
      viewModelBuilder: () => ForgotPasswordScreenViewModel(),
    );
  }
}
