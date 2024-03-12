import "package:flutter/material.dart";

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(139, 195, 74, .1),
  100: const Color.fromRGBO(139, 195, 74, .2),
  200: const Color.fromRGBO(139, 195, 74, .3),
  300: const Color.fromRGBO(139, 195, 74, .4),
  400: const Color.fromRGBO(139, 195, 74, .5),
  500: const Color.fromRGBO(139, 195, 74, .6),
  600: const Color.fromRGBO(139, 195, 74, .7),
  700: const Color.fromRGBO(139, 195, 74, .8),
  800: const Color.fromRGBO(139, 195, 74, .9),
  900: const Color.fromRGBO(139, 195, 74, 1),
};

abstract class CustomColors {
  static Color customGreenColor = Colors.green.shade700;
  static Color customLightGreenColor = Colors.green.shade500;
  static Color customPurpleColor = Colors.purple.shade700;

  static Color customLightPurpleColor = Colors.purple.shade500;
  static Color customWhitechColor = Colors.white;
}
