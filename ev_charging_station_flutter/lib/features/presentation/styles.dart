import 'package:flutter/material.dart';

abstract class Styles {
  static ThemeData primaryTheme(BuildContext context) {
    return ThemeData(
        primaryColor: colorAccent,
        primarySwatch: colorAccent,
        colorScheme: const ColorScheme.light(
            primary: colorAccent, secondary: colorAccent),
        fontFamily: fontPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: scaffoldBackground,
        ),
        buttonTheme:
            Theme.of(context).buttonTheme.copyWith(buttonColor: colorAccent),
        dividerTheme: Theme.of(context)
            .dividerTheme
            .copyWith(space: 21, color: rowDivider),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: fontPrimary),
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }

  static const InputDecoration textFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    errorText: null,
    suffixText: 'inches',
  );

  static const TextStyle alertButton = TextStyle(
    color: colorAccent,
    fontSize: 15,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle pageTitle = TextStyle(
    color: colorIconTint,
    fontSize: 26,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle description = TextStyle(
    color: colorIconTint,
    fontSize: 14,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle choiceChipLabelSelected = TextStyle(
    color: colorPrimary,
    fontSize: 11,
    fontFamily: fontPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    color: colorAccent,
    fontSize: 16,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardSubTitle = TextStyle(
    color: colorAccentLight,
    fontSize: 14,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle dropdownItem = TextStyle(
    color: Color(0xFF4A4A68),
    fontSize: 16,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle dropdownItemSection = TextStyle(
    color: colorAccentLight,
    fontSize: 16,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle profileMenuTitle = TextStyle(
    color: colorAccent,
    fontSize: 16,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle searchPageTitle = TextStyle(
    color: Color(0xFF005FB9),
    fontSize: 24,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle button = TextStyle(
    color: scaffoldBackground,
    fontSize: 15,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle input = TextStyle(
    color: colorIconTint,
    fontSize: 16,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle tutorialTitle = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle tutorialDesciption = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle apparelCollectionTitle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle apparelCollectionDescription = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle errorText = TextStyle(
    color: colorTextError,
    fontSize: 13,
    fontFamily: fontPrimary,
    fontWeight: FontWeight.bold,
  );

  static const EdgeInsets spaceS = EdgeInsets.all(4);

  static const EdgeInsets space = EdgeInsets.all(8);

  static const EdgeInsets spaceM = EdgeInsets.all(16);

  static const EdgeInsets spaceL = EdgeInsets.all(24);

  static const EdgeInsets spaceXL = EdgeInsets.all(32);

  static const EdgeInsets spaceXXL = EdgeInsets.all(48);

  static const Color colorPrimary = Color(0xFFFFFFFF);

  static const Map<int, Color> colorAccentMap = {
    50: Color.fromRGBO(0, 95, 185, .1),
    100: Color.fromRGBO(0, 95, 185, .2),
    200: Color.fromRGBO(0, 95, 185, .3),
    300: Color.fromRGBO(0, 95, 185, .4),
    400: Color.fromRGBO(0, 95, 185, .5),
    500: Color.fromRGBO(0, 95, 185, .6),
    600: Color.fromRGBO(0, 95, 185, .7),
    700: Color.fromRGBO(0, 95, 185, .8),
    800: Color.fromRGBO(0, 95, 185, .9),
    900: Color.fromRGBO(0, 95, 185, 1),
  };

  static const MaterialColor colorAccent =
      MaterialColor(0xFF005FB9, colorAccentMap);

  static const Color colorAccentLight = Color(0xFF4D8FCE);

  static const Color colorTextTitle = Color(0xFF282B4C);

  static const Color colorTextError = Color(0xFFD65050);

  static const Color colorIconTint = Color(0xFF1D1D44);

  static const Color rowDivider = Color(0xFFD9D9D9);

  static const Color grey = Color(0xFFBBBBCA);

  static const Color showdownColor = Color.fromRGBO(0, 95, 185, .1);

  static const Color containerBackground = Color(0xfff0f0f0);

  static const Color scaffoldBackground = Color(0xFFFAFCFE);

  static const Color chipBackground = Color(0xFFE2F1FF);

  static const String fontPrimary = 'HeroNew';
}
