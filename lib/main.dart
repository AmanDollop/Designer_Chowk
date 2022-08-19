import 'package:designer_chock/app/Colors/colors_manager.dart';
import 'package:designer_chock/app/Themes/dark_theme.dart';
import 'package:designer_chock/app/Themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/views/change_language.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      translations: LanguageTanslation(),
      locale: const Locale("en", "US"),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        appBarTheme: ThemeLightMode().appBarTheme,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: LightModeColors().secondaryColor,
        ),
        colorScheme: ColorScheme.light(
          primary: LightModeColors().secondaryColor,
          secondary: LightModeColors().secondaryColor,
          background: LightModeColors().screenBackgroundColor,

          error: Colors.red,
          outline: Colors.grey.shade100,
          onPrimary: LightModeColors().BackgroundColor,
          onSecondary: LightModeColors().darkPrimaryColor,
        ),

        textTheme: TextTheme(
          headline1: ThemeLightMode().headingText,
          button: ThemeLightMode().buttonTextStyle,
          bodyText2: ThemeLightMode().titleText,
          bodyText1: ThemeLightMode().captionTextStyle,
          headline2: ThemeLightMode().bodyTextStyle,
          headline6: ThemeLightMode().pinCodeTextFieldStyle,
          headline4: ThemeLightMode().numberTextStyle,
        ),
        inputDecorationTheme: ThemeLightMode().inputDecorationTheme,
        outlinedButtonTheme: ThemeLightMode().outlinedButtonThemeData,
        bottomSheetTheme: ThemeLightMode().bottomSheetThemeData,
        elevatedButtonTheme: ThemeLightMode().elevatedButtonThemeData,
        scaffoldBackgroundColor: LightModeColors().BackgroundColor,
        textButtonTheme: ThemeLightMode().textButtonThemeData,
      ),
      darkTheme: ThemeData(
        appBarTheme: ThemeDarkMode().appBarTheme,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: DarkModeColors().secondaryColor,
        ),
        colorScheme: ColorScheme.dark(
          primary: DarkModeColors().secondaryColor,
          secondary: DarkModeColors().secondaryColor,
          background: DarkModeColors().screenBackgroundColor,
          error: Colors.red,
          outline: Colors.grey.shade100,
          onPrimary: DarkModeColors().BackgroundColor,
          onSecondary: DarkModeColors().headingTextColor
        ),

        textTheme: TextTheme(
          headline1: ThemeDarkMode().headingText,
          button: ThemeDarkMode().buttonTextStyle,
          bodyText2: ThemeDarkMode().titleText,
          bodyText1: ThemeDarkMode().captionTextStyle,
          headline2: ThemeDarkMode().bodyTextStyle,
          headline6: ThemeLightMode().pinCodeTextFieldStyle,
          headline4: ThemeDarkMode().numberTextStyle,
        ),
         outlinedButtonTheme: ThemeDarkMode().outlinedButtonThemeData,
        bottomSheetTheme: ThemeDarkMode().bottomSheetThemeData,
        inputDecorationTheme: ThemeDarkMode().inputDecorationTheme,
        elevatedButtonTheme: ThemeDarkMode().elevatedButtonThemeData,
        scaffoldBackgroundColor: DarkModeColors().BackgroundColor,
        textButtonTheme: ThemeDarkMode().textButtonThemeData,
      ),
    ),
  );
}
