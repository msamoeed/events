import 'package:events/classes/splashScreenCustom.dart';
import 'package:events/views/onboading_screen/onboading_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'splashscreen_view_model.dart';

class SplashscreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashscreenViewModel>.reactive(
      builder:
          (BuildContext context, SplashscreenViewModel viewModel, Widget _) {
        return Scaffold(
          body: AdvancedSplashScreen(
            animate: true,
            appIcon: 'assets/logo.png',
            appTitle: "Plan Your Events",
            appTitleStyle: GoogleFonts.abel(
                color: Color(0xffF59A23),
                fontSize: 28,
                fontWeight: FontWeight.w600),
            seconds: 3,
            colorList: [Colors.white],
            child: OnboadingScreenView(),
          ),
        );
      },
      viewModelBuilder: () => SplashscreenViewModel(),
    );
  }
}
