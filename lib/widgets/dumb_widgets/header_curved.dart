import 'package:e_control/constants/colors.dart';
import 'package:e_control/constants/fonts.dart';
import 'package:e_control/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  final String title;

  const HomeHeader({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(40)),
            height: SizeConfig.blockSizeVertical * 8,
            width: SizeConfig.screenWidth,
            child: Center(
              child: Text(
                title,
                style: t10appColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeHeader2 extends StatelessWidget {
  final String title;

  const HomeHeader2({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            decoration: BoxDecoration(
                color: widgetcolor,
                borderRadius: BorderRadiusDirectional.circular(5)),
            height: SizeConfig.blockSizeVertical * 8,
            width: SizeConfig.screenWidth,
            child: Center(
              child: Text(
                title,
                style: t1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeHeader3 extends StatelessWidget {
  final String title;

  const HomeHeader3({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ClipPath(
          clipper: OvalTopBorderClipper(),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadiusDirectional.circular(0)),
            height: SizeConfig.blockSizeVertical * 6,
            width: SizeConfig.screenWidth,
            child: Center(
              child: Text(
                title,
                style: t1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeMenuCards extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function onpress;
  const HomeMenuCards({
    Key key,
    this.title,
    this.icon,
    this.iconColor,
    this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpress,
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: t2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeMenuCardsWithNumbers extends StatelessWidget {
  final String title;
  final String number;
  final Color textColor;
  const HomeMenuCardsWithNumbers({
    Key key,
    this.title,
    this.number,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Card(
      elevation: 3,
      child: Column(
        children: [
          Text(number,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 3.5,
                    color: textColor),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: t2,
            ),
          )
        ],
      ),
    );
  }
}
