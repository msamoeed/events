import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:events/widgets/dumb_widgets/header_curved.dart';
import 'package:events/widgets/dumb_widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'forgot_password_screen_view_model.dart';

class ForgotPasswordScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordScreenViewModel>.reactive(
      builder: (BuildContext context, ForgotPasswordScreenViewModel viewModel,
          Widget _) {
        return Scaffold(
            backgroundColor: backgroundcolor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: backgroundcolor,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HomeHeader2(
                    title: 'Forgot Password',
                  ),
                ),
                TextFields(
                  onChanged: (em) {
                    viewModel.email = em;
                  },
                  icon: Tab(
                    child: Icon(
                      Icons.email_rounded,
                      color: appColor,
                    ),
                  ),
                  hintText: "Email",
                  secureText: false,
                  borderColor: appColor,
                  focusColor: Colors.white,
                  context: null,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () async {
                        await viewModel.sendResetEmail();
                      },
                      child: Text(
                        'Send Request',
                        style: t1,
                      )),
                )
              ],
            ));
      },
      viewModelBuilder: () => ForgotPasswordScreenViewModel(),
    );
  }
}
