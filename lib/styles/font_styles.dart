import 'package:flutter/material.dart';

import 'app_colors.dart';

TextStyle customFontStyle({
  Color? fontColor = black,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 12.0,
  double fontHeight = 12.0,
  double letterSpace = 0,
}) =>
    TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
      height: fontHeight / fontSize,
      letterSpacing: letterSpace,
    );

TextStyle bottomNavbarFontStyle({Color? fontColor = gray}) => TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 12,
  color: fontColor,
);

TextStyle buttonTextStyle({Color? fontColor = white}) => TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: fontColor,
);

TextStyle defaultLableStyle({
  Color? fontColor = black,
  double fontSize = 17.0,
  FontWeight fontWeight = FontWeight.w600,
}) =>
    TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );

TextStyle hintStyle({Color? fontColor = gray}) => TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 13.0,
  color: fontColor,
);

TextStyle inputStyle({Color? fontColor = black}) => TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 13.0,
  color: fontColor,
);

TextStyle errorLableStyle({Color? fontColor = red}) => TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 10.0,
  color: fontColor,
);

TextStyle dateLableStyle({Color? fontColor = black}) => TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: fontColor,
);

const appColor = Color.fromRGBO(68, 139, 245, 1);

//!Registration

//* Intro Pages
const kFont14 =  TextStyle(
    color:  Color(0xffA1B4D0),
    fontFamily: 'Nunito',
    fontSize: 14,
    fontWeight: FontWeight.w600);

const kFont15 =  TextStyle(
    color:  Color(0xff65849D),
    fontFamily: 'Nunito',
    fontSize: 15,
    fontWeight: FontWeight.w400);

const kFont16 =  TextStyle(
    color:  Colors.black,
    fontFamily: 'Nunito',
    fontSize: 16,
    fontWeight: FontWeight.w400);

const kFont16SigIn =  TextStyle(
    color:  Color(0xFF46B88F),
    fontFamily: 'Nunito',
    fontSize: 16,
    fontWeight: FontWeight.w400);

const kFont18 =  TextStyle(
    color:  Colors.black,
    fontFamily: 'Nunito',
    fontSize: 18,
    fontWeight: FontWeight.w400);

const kFont20 = TextStyle(
    color:  Color(0xff343434),
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 20);

const kFont24SignUp = TextStyle(
    color:  Color(0xff46B88F),
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 24);


const kFont24Cart = TextStyle(
    color:  Color(0xffAECAA5),
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 24);

const kFont24CartBlack = TextStyle(
    color:  Colors.black,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 24);

const kFont26Cart = TextStyle(
    color:  Color(0xffAECAA5),
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 26);

const kFont26Get = TextStyle(
    color:  Colors.white,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
    fontSize: 26);

const kFont26 = TextStyle(
    color:  Colors.black,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    fontSize: 26);

final kSettingsSubtitle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: const Color(0xff8B98AA));


const kFont30 = TextStyle(
    color:  Color(0xff343434),
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
    fontSize: 30);

final kSettingsTitle = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: const Color(0xff1A191E));


