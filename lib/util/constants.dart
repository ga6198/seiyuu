import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Constants {
  static String appName = "Seiyuu";

  //Colors for theme
  static const Color mainPrimary = Color(0xfff5f5f5); //light grey
  static const Color mainAccent = Color(0xffffb6c1); //light pink
  static const Color mainBG = Color(0xffffb6c1); //light pink
  static const Color badgeColor = Colors.red;
  static const Color tertiaryColor = Color(0xffff69b4); //hot pink

  static ThemeData mainTheme = ThemeData(
    backgroundColor: mainBG,
    primaryColor: mainPrimary,
    accentColor: mainAccent,
    cursorColor: mainAccent,
    scaffoldBackgroundColor: mainBG,
    cardColor: mainPrimary,
    secondaryHeaderColor: tertiaryColor,
    fontFamily: "Segoe UI",
    appBarTheme: AppBarTheme(
      color: mainBG, //tertiaryColor,
      elevation: 4,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.w800,
          fontFamily: "Franklin Gothic",
        ),
      ),
    ),
  );

  static const double BORDER_RADIUS = 30;

  //-------Max numbers for form fields-------//
  //max name length
  static const int MAX_NAME_LENGTH = 50;
  //max price length
  static const int MAX_PRICE_LENGTH = 10;
  //max weight length
  static const int MAX_WEIGHT_LENGTH = 10;
  //max description length
  static const int MAX_DESCRIPTION_LENGTH = 100;
  //maximum number of item images
  static const int MAX_IMAGE_COUNT = 5;

  //form attributes
  static TextStyle FORM_LABEL_STYLE =
      TextStyle(color: Colors.white, fontSize: 16.0);

  //alert dialog attributes
  static double DIALOG_TITLE_SIZE = 20;
  static double DIALOG_BUTTON_TEXT_SIZE = 16;
  static TextStyle DIALOG_BUTTON_STYLE =
      TextStyle(fontSize: DIALOG_BUTTON_TEXT_SIZE);

  //icons used in the application
  static const IconData ICON_BIRTHDAY = Icons.cake;
  static const IconData ICON_BLOOD_TYPE = MdiIcons.water;
  static const IconData ICON_HEIGHT = MdiIcons.humanMaleHeight;
  static const IconData ICON_AGENCY = MdiIcons.briefcase;
  static const IconData ICON_ROLES = Icons.star;
  static const IconData ICON_BIRTHPLACE = Icons.location_on;

  static const Map ICONS_ZODIAC = {
    'Aries': MdiIcons.zodiacAries,
    'Taurus': MdiIcons.zodiacTaurus,
    'Gemini': MdiIcons.zodiacGemini,
    'Cancer': MdiIcons.zodiacCancer,
    'Leo': MdiIcons.zodiacLeo,
    'Virgo': MdiIcons.zodiacVirgo,
    'Libra': MdiIcons.zodiacLibra,
    'Scorpio': MdiIcons.zodiacScorpio,
    'Sagittarius': MdiIcons.zodiacSagittarius,
    'Capricorn': MdiIcons.zodiacCapricorn,
    'Aquarius': MdiIcons.zodiacAquarius,
    'Pisces': MdiIcons.zodiacPisces,
  };

  static final LatLng COORDINATES_JAPAN =
      const LatLng(36.2048, 138.2529); //Japan coordinates

  //--------Image Settings--------//
  //max image width/height
  static const double MAX_IMAGE_WIDTH = 640;
  static const double MAX_IMAGE_HEIGHT = 480;

  static const double CARD_IMAGE_WIDTH = 135;
  static const double CARD_IMAGE_HEIGHT = 180;
  static const double CARD_WIDTH = 330;

  //firebase storage folder names
  static const String USER_FOLDER_NAME = 'users';
  static const String ITEM_FOLDER_NAME = 'items';
  static const String CHAT_FOLDER_NAME = 'chatPics';
}
