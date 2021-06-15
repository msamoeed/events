import 'package:events/constants/colors.dart';
import 'package:events/constants/fonts.dart';
import 'package:events/views/forgot_password_screen/forgot_password_screen_view.dart';
import 'package:events/views/signupscreen/signupscreen_view.dart';
import 'package:events/widgets/dumb_widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'loginscreen_view_model.dart';

class LoginscreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginscreenViewModel>.reactive(
      builder:
          (BuildContext context, LoginscreenViewModel viewModel, Widget _) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: viewModel.key,
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  tileMode: TileMode.mirror,
                  colors: [
                    backgroundcolor,
                    backgroundcolor,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Image.asset(
                      'assets/logo.png',
                      height: 120,
                    )),
                    SizedBox(
                      height: 45,
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
                    TextFields(
                      show: IconButton(
                        icon: Icon(
                          viewModel.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          viewModel.setStatePasswordVisible();
                        },
                      ),
                      icon: Tab(
                        child: Icon(
                          Icons.lock,
                          color: appColor,
                        ),
                      ),
                      hintText: "Password",
                      onChanged: (pa) {
                        viewModel.password = pa;
                      },
                      secureText: viewModel.passwordVisible,
                      borderColor: appColor,
                      focusColor: Colors.white,
                      context: null,
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 28.0, top: 5),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Your Password?',
                              style: GoogleFonts.abel(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ForgotPasswordScreenView()));
                      },
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.blueAccent)),
                        child: GestureDetector(
                            onTap: viewModel.provideEmailSign,
                            child: Center(
                              child: Text(
                                "     Login     ",
                                style: t10appColor,
                              ),
                            )),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupscreenView()));
                          },
                          child: Text(
                            'Sign Up',
                            style: t1white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginscreenViewModel(),
    );
  }
}
