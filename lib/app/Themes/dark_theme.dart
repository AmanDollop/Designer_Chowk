import 'package:designer_chock/app/Colors/colors_manager.dart';
import 'package:designer_chock/app/Themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar_theme.dart';
import 'package:flutter/src/painting/text_style.dart';


class ThemeDarkMode extends ThemeManager {
  @override
  AppBarTheme get appBarTheme => AppBarTheme(
    iconTheme: IconThemeData(color:DarkModeColors().headingTextColor),
    backgroundColor: DarkModeColors().BackgroundColor,
  );

  @override
  TextStyle get headingText => TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: DarkModeColors().primaryColor,
      fontFamily: "GilroyBold");

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            primary: DarkModeColors().primaryColor,
            minimumSize:Size(189, 50)
        ),
      );

  @override
  TextStyle get buttonTextStyle => TextStyle(
    fontSize:14,fontFamily: "GilroySemiBold",fontWeight: FontWeight.w600,color: DarkModeColors().BackgroundColor,
  );

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(style: TextButton.styleFrom(primary: DarkModeColors().secondaryColor));

  @override
  TextStyle get titleText => TextStyle(
    fontSize: 18,fontWeight: FontWeight.w400,fontFamily: "GilroySemiBold",color: DarkModeColors().titleColor,
  );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    focusColor: DarkModeColors().secondaryColor,
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: DarkModeColors().secondaryColor,
        width: 1,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: DarkModeColors().captionColor,
        width: 1,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: DarkModeColors().secondaryColor,
          width: 1
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: DarkModeColors().secondaryColor,
          width: 1
      ),
    ),
  );

  @override
  BottomSheetThemeData get bottomSheetThemeData =>BottomSheetThemeData(
    backgroundColor: DarkModeColors().screenBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
    ),
  );

  @override
  TextStyle get captionTextStyle => TextStyle(
    fontSize: 16,fontWeight: FontWeight.w400,fontFamily:"GilroyMedium",color: DarkModeColors().captionColor,
  );

  @override
  TextStyle get bodyTextStyle => TextStyle(
    fontSize: 18,fontWeight: FontWeight.w400,fontFamily:"GilroySemiBold",color: DarkModeColors().captionColor,
  );

  @override
  TextStyle get pinCodeTextFieldStyle => TextStyle(
    fontSize: 25,fontWeight: FontWeight.w400,fontFamily: "GilroySemiBold",color: DarkModeColors().headingTextColor,
  );

  @override
  TextStyle get numberTextStyle =>TextStyle(
    fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "GilroyBold",color: DarkModeColors().titleColor,
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
