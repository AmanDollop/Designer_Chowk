import 'package:designer_chock/app/Colors/colors_manager.dart';
import 'package:designer_chock/app/Themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeLightMode extends ThemeManager {
  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        iconTheme: IconThemeData(color:LightModeColors().headingTextColor),
        backgroundColor: LightModeColors().BackgroundColor,
      );

  @override
  TextStyle get headingText => TextStyle(
      fontSize: 32,
      color: LightModeColors().primaryColor,
      fontFamily: "GilroyBold");

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: LightModeColors().primaryColor,
          minimumSize:Size(189, 50)
        ),
      );

  @override
  TextStyle get buttonTextStyle => TextStyle(
    fontSize:14,fontFamily: "GilroySemiBold",color: LightModeColors().BackgroundColor,
  );

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(style: TextButton.styleFrom(primary: LightModeColors().secondaryColor));

  @override
  TextStyle get titleText => TextStyle(
    fontSize: 18,fontFamily: "GilroySemiBold",color: LightModeColors().titleColor,
  );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    focusColor: LightModeColors().secondaryColor,
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: LightModeColors().secondaryColor,
        width: 1,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: LightModeColors().captionColor,
        width: 1,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: LightModeColors().secondaryColor,
          width: 1
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: LightModeColors().secondaryColor,
          width: 1
      ),
    ),
  );

  @override
  BottomSheetThemeData get bottomSheetThemeData =>BottomSheetThemeData(
    backgroundColor: LightModeColors().BackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
    ),
  );

  @override
  TextStyle get captionTextStyle => TextStyle(
    fontSize: 16,fontFamily:"GilroyMedium",color: LightModeColors().captionColor
  );

  @override
  TextStyle get bodyTextStyle => TextStyle(
    fontSize: 18,fontFamily:"GilroySemiBold",color: LightModeColors().captionColor,
  );

  @override
  TextStyle get pinCodeTextFieldStyle => TextStyle(
    fontSize: 25,fontFamily: "GilroySemiBold",color: LightModeColors().headingTextColor,
  );

  @override

  TextStyle get numberTextStyle =>  TextStyle(
    fontSize: 18,fontFamily: "GilroyBold",color: LightModeColors().titleColor,
  );


@override
  OutlinedButtonThemeData get outlinedButtonThemeData =>OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),


    )
  );



}
