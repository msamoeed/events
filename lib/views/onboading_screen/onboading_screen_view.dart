import 'package:events/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'onboading_screen_view_model.dart';

class OnboadingScreenView extends StatefulWidget {
  @override
  _OnboadingScreenViewState createState() => _OnboadingScreenViewState();
}

class _OnboadingScreenViewState extends State<OnboadingScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboadingScreenViewModel>.reactive(
      builder:
          (BuildContext context, OnboadingScreenViewModel viewModel, Widget _) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    Color(0xFF3594DD),
                    Color(0xFF4563DB),
                    Color(0xFF5036D5),
                    Color(0xFF5B16D0),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () =>
                            viewModel.navigateToProvisioningScreen(),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 600.0,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: viewModel.pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            viewModel.currentPage = page;
                          });
                        },
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/logo.png',
                                    ),
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'Connect with People',
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Create events for friends and family',
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: CircleAvatar(
                                    child: Center(
                                        child: Icon(
                                      FontAwesomeIcons.stickyNote,
                                      size: 130,
                                    )),
                                    radius: 150,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'Event creation and other features',
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Create general or sports event and plan with family or friends',
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: CircleAvatar(
                                    child: Center(
                                        child: Icon(
                                      FontAwesomeIcons.mailBulk,
                                      size: 130,
                                    )),
                                    radius: 150,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'Chat with People',
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Chat within app to people with common interests',
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: viewModel.buildPageIndicator(),
                    ),
                    viewModel.currentPage != viewModel.numPages - 1
                        ? Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomRight,
                              child: FlatButton(
                                onPressed: () {
                                  viewModel.pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: viewModel.currentPage == viewModel.numPages - 1
              ? Container(
                  height: 100.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => viewModel.navigateToProvisioningScreen(),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            color: Color(0xFF5B16D0),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Text(''),
        );
      },
      viewModelBuilder: () => OnboadingScreenViewModel(),
    );
  }
}
