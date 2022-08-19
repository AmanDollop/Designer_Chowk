import 'package:flutter/material.dart';

abstract class ColorsManager{
  Color get primaryColor;
  Color get darkPrimaryColor;
  Color get lightPrimaryColor;

  Color get secondaryColor;
  Color get darkSecondaryColor;
  Color get lightSecondaryColor;

  Color get headingTextColor;
  Color get bodyTextColor;
  Color get titleColor;
  Color get captionColor;

  Color get screenBackgroundColor;
  Color get BackgroundColor;


}

class LightModeColors extends ColorsManager{

  @override
  Color get primaryColor =>const Color(0xff0F0D0E);
  @override
  Color get darkPrimaryColor =>const Color(0xff000000);
  @override
  Color get lightPrimaryColor =>const Color(0xff262325);


  @override
  Color get secondaryColor =>const Color(0xffFB0067);
  @override
  Color get darkSecondaryColor =>const Color(0xffFB0067);
  @override
  Color get lightSecondaryColor =>const Color(0xffd91864);



  @override
  Color get bodyTextColor => const Color(0xff121614);

  @override
  Color get captionColor => const Color(0xff6F7C8E);

  @override
  Color get headingTextColor => const Color(0xff0F0D0E);

  @override
  Color get titleColor =>const Color(0xff0F0D0E);

  @override
  Color get BackgroundColor => const Color(0xffffffff);

  @override
  Color get screenBackgroundColor => Color(0xfff6f7fb);
}



class DarkModeColors extends ColorsManager {
  @override
  Color get primaryColor => const Color(0xff808080);

  @override
  Color get darkPrimaryColor => const Color(0xff545252);

  @override
  Color get lightPrimaryColor => const Color(0xffafa3a3);


  @override
  Color get secondaryColor => const Color(0xffFB0067);

  @override
  Color get darkSecondaryColor => const Color(0xffFB0067);

  @override
  Color get lightSecondaryColor => const Color(0xffd91864);



  @override
  Color get bodyTextColor => const Color(0xffb8e7cf);

  @override
  Color get captionColor => const Color(0xff6F7C8E);

  @override
  Color get headingTextColor => const Color(0xffffffff);

  @override
  Color get titleColor =>const Color(0xfff3cde0);

  @override
  Color get BackgroundColor =>const Color(0xff000000) ;

  @override
  Color get screenBackgroundColor => Color(0xff181818);
}