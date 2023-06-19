import 'package:flutter/material.dart';

class MyColors extends ChangeNotifier {
  bool isLightMode = true;
  Color primaryColor = Color(0xFF106CFF);
  Color primaryTextColor = Color(0xFF454F63);
  Color secondaryTextColor = Color(0xFF848484);
  Color greyTextColor = Color(0xFF8D8D8D);
  Color greyTextColor2 = Color(0xFF858585);
  Color greyTextColor3 = Color(0xFF6D6D6D);
  Color boxBorderColor = Color(0xFFE8E8E8);
  Color textfieldColor = Color(0xFFF3F6FB);
  Color iconsColor = Color(0xFF798191);
  Color tabsIconColor = Color(0xFFB7B7B7);
  Color inActiveToggleColor = Color(0xFFE2EDFF);
  Color inActiveToggleIconColor = Color(0xFF92A3C7);
  Color buttonTabColor = Color(0xFFCDD1E0);
  Color arrowGrey = Color(0xFF7A7D7E);
  Color borderColor = Color(0xFFB1B5C3);
  Color pinkColor = Color(0xFFED4351);
  Color box1 = Color(0xFFEAEAEA);
  Color box2 = Color(0xFF6C757D);
  Color black2 = Color(0xFF0A0D13);
  Color whiteColor = Colors.white;
  Color blackColor = Colors.black;
  Color greyColor = Colors.grey;


  void changeThemeToBlack() {
    isLightMode = false;
    whiteColor = Colors.black;
    blackColor = Colors.white;

    notifyListeners();
  }

  void changeThemeToLight() {
    isLightMode = true;
    whiteColor = Colors.white;
    blackColor = Colors.black;

    notifyListeners();
  }

  changeTheme(bool isLightModeEnabled) {
    isLightMode = isLightModeEnabled;
    notifyListeners();
  }
}
