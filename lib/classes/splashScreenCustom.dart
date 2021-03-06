import 'dart:async';

import 'package:events/views/bottom_bar/bottom_bar_view.dart';
import 'package:events/views/onboading_screen/onboading_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdvancedSplashScreen extends StatefulWidget {
  final Widget child;
  final int seconds;
  final int milliseconds;

  final bool animate;

  final List<Color> colorList;
  final String backgroundImage;
  final double bgImageOpacity;
  final String appIcon;
  final String appTitle;
  final TextStyle appTitleStyle;

  AdvancedSplashScreen(
      {this.child,
      this.seconds = 1,
      this.milliseconds = 0,
      this.animate = true,
      this.colorList = const [],
      this.backgroundImage,
      this.bgImageOpacity = 0.5,
      this.appIcon = "images/flutter_social.png",
      this.appTitle = "Flutter Social",
      this.appTitleStyle = const TextStyle(
          fontSize: 23.0,
          color: Colors.white,
          fontFamily: "",
          fontWeight: FontWeight.bold)});

  @override
  _AdvancedSplashScreenState createState() => _AdvancedSplashScreenState();
}

class _AdvancedSplashScreenState extends State<AdvancedSplashScreen>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  Animation<double> _animationText;
  AnimationController _animationController;

  List<double> stopList = [];

  bool isLoggedIn = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final usr = FirebaseAuth.instance.currentUser;
      if (usr != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
    });

    buildStopList();

    handleScreenReplacement();

    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds: (widget.seconds / 2).truncate(),
            milliseconds: (widget.milliseconds / 2.5).truncate()));
    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    _animationText = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    if (widget.animate) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          (widget.backgroundImage != null)
              ? AssetImage(widget.backgroundImage)
              : Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: stopList,
                    colors: widget.colorList,
                  )),
                ),
          Container(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform(
                    transform: Matrix4.translationValues(
                        _animation.value * size.width, 0.0, 0.0),
                    child: (widget.appIcon != null)
                        ? Center(
                            child: Image.asset(
                              widget.appIcon,
                              width: size.width / 1.5,
                              height: size.height / 1.5,
                            ),
                          )
                        : SizedBox(
                            width: 0.0,
                            height: 0.0,
                          ));
              },
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.translationValues(
                    0.0, -1 * _animationText.value * size.height, 0.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.appTitle,
                      style: widget.appTitleStyle,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void handleScreenReplacement() {
    Timer(Duration(seconds: widget.seconds, milliseconds: widget.milliseconds),
        () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        if (isLoggedIn) {
          return BottomBarView();
        } else {
          return OnboadingScreenView();
        }
        // return widget.child;
      }));
    });
  }

  void buildStopList() {
    stopList = [];

    double stopListVal = 0.4;
    widget.colorList.forEach((color) {
      stopList.add(stopListVal);
      stopListVal += 0.2;
    });
  }
}
