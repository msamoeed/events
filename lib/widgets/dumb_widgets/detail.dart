import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail extends StatelessWidget {
  const Detail({
    Key key,
    this.title,
    this.text, this.size,
  }) : super(key: key);
  final title;
  final text;
  final size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title + ": ",
              style: GoogleFonts.josefinSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: (size==null)?ScreenUtil().setSp(15):ScreenUtil().setSp(size))),
          Flexible(
            child: Text(text,
                style: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: (size==null)?ScreenUtil().setSp(15):ScreenUtil().setSp(size))),
          ),
        ],
      ),
    );
  }
}
