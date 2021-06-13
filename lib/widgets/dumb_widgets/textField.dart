import 'package:e_control/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {Key key,
      this.textControl,
      @required this.icon,
      @required this.hintText,
      @required this.context,
      this.helpText,
      @required this.secureText,
      this.input,
      this.show,
      this.borderColor,
      this.focusColor,
      this.onTap1,
      this.enabled,
      this.suffix,
      this.onChanged,
      this.controller})
      : super(key: key);

  final Tab icon;
  final TextEditingController controller;
  final String hintText;
  final BuildContext context;
  final String helpText;
  final bool secureText;
  final TextInputType input;
  final IconButton show;
  final Color borderColor;
  final Color focusColor;
  final Function onTap1;
  final bool enabled;
  final Function onChanged;
  final TextEditingController textControl;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 10, start: 10),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(38)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextFormField(
                  // inputFormatters: [maskTextInputFormatter],
                  // controller: textControl,

                  onChanged: onChanged,
                  keyboardType: input,

                  enabled: enabled,
                  onTap: () {
                    onTap1;
                  },
                  style: t10appColor,
                  validator: (String ar) {
                    if (ar.length < 3)
                      return 'Name must be more than 2 charater';
                    else
                      return null;
                  },
                  controller: controller,
                  obscureText: secureText,
                  decoration: InputDecoration(
                      prefixIcon: icon,
                      suffixIcon: show,
                      suffix: suffix,
                      focusColor: focusColor,
                      hintText: hintText,
                      
                      hintStyle: t10appColor,
                      labelText: helpText,
                      border: InputBorder.none),
                ),
              ),
            ),
          )),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}

class TextFields2 extends StatelessWidget {
  const TextFields2(
      {Key key,
      this.textControl,
      @required this.icon,
      @required this.hintText,
      @required this.context,
      this.helpText,
      @required this.secureText,
      this.input,
      this.show,
      this.borderColor,
      this.focusColor,
      this.onTap1,
      this.enabled,
      this.onChanged})
      : super(key: key);

  final Tab icon;
  final String hintText;
  final BuildContext context;
  final String helpText;
  final bool secureText;
  final TextInputType input;
  final IconButton show;
  final Color borderColor;
  final Color focusColor;
  final Function onTap1;
  final bool enabled;
  final Function onChanged;
  final TextEditingController textControl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 20, start: 20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 4, color: borderColor),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: TextFormField(
                  controller: textControl,
                  onChanged: onChanged,
                  keyboardType: input,
                  enabled: enabled,
                  onTap: () {
                    onTap1;
                  },
                  style: TextStyle(
                    color: focusColor,
                  ),
                  validator: (String ar) {
                    if (ar.length < 3)
                      return 'Name must be more than 2 charater';
                    else
                      return null;
                  },
                  obscureText: secureText,
                  decoration: InputDecoration(
                      suffixIcon: show,
                      focusColor: focusColor,
                      icon: icon,
                      hintText: hintText,
                      hintStyle: TextStyle(fontSize: 17, color: focusColor),
                      labelText: helpText,
                      border: InputBorder.none),
                ),
              ),
            ),
          )),
    );
  }
}

class TextFields3 extends StatelessWidget {
  const TextFields3(
      {Key key,
      @required this.hintText,
      @required this.context,
      this.helpText,
      this.input,
      this.show,
      this.borderColor,
      this.focusColor,
      this.onTap1,
      this.enabled,
      this.onChanged,
      this.secureText,
      this.icon})
      : super(key: key);

  final Tab icon;
  final String hintText;
  final BuildContext context;
  final String helpText;
  final bool secureText;
  final TextInputType input;
  final IconButton show;
  final Color borderColor;
  final Color focusColor;
  final Function onTap1;
  final bool enabled;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 20, start: 20),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TextFormField(
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          enabled: enabled,
          onTap: () {
            onTap1;
          },
          style: TextStyle(
            color: focusColor,
          ),
          validator: (String ar) {
            if (ar.length < 3)
              return 'Name must be more than 2 charater';
            else
              return null;
          },
          obscureText: false,
          decoration: InputDecoration(
              suffixIcon: show,
              focusColor: focusColor,
              prefixIcon: Icon(FontAwesomeIcons.notesMedical),
              hintText: "Quantity",
              hintStyle: TextStyle(fontSize: 17, color: focusColor),
              // labelText: helpText,
              enabled: true,
              alignLabelWithHint: true,
              labelText: hintText,
              labelStyle: TextStyle(fontSize: 17, color: focusColor),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), gapPadding: 4)),
        ),
      ),
    );
  }
}
