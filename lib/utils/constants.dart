import 'package:flutter/material.dart';

const COLOR_LIGHT_PURPLE = Color(0xffb845eb);

const primary= Color(0xff8e4dea);
const blue=Color(0xff3738a2);
const String placeHolderLandScape='assets/placeholder/landscape.jpg';
const colorGardient=LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xffa342d7),
    Color(0xff271f59),
  ],
);

const COLOR_DARK_PURPLE = Color(0xff701b97);

const COLOR_LIGHT_BLUE = Color(0xff3639a4);

const COLOR_DARK_BLUE = Color(0xff3639a4);

const COLOR_YELLOW = Color(0xffffbc00);

const COLOR_GREEN = Color(0xff00c797);

const COLOR_RED = Color(0xff9f0000);

const COLOR_GREY = Color(0xff60628a);

const COLOR_WHITE = Color(0xffffffff);

const COLOR_BLACK = Color(0xFF000000);


const TextTheme TEXT_THEME_DEFAULT = TextTheme(

  headline1: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w700, fontSize: 26),
  headline2: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w700, fontSize: 22),
  headline3: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w700, fontSize: 20),
  headline4: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w700, fontSize: 16),
  headline5: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w700, fontSize: 14),
  headline6: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w700, fontSize: 12),
  bodyText1: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w500, fontSize: 14, height: 1.5),
  bodyText2: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w500, fontSize: 14, height: 1.5),
  subtitle1: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w400, fontSize: 12),
  subtitle2: TextStyle(
      color: COLOR_LIGHT_PURPLE, fontWeight: FontWeight.w400, fontSize: 12),
);