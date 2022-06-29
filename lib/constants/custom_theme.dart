import 'package:agency/constants/custom_color.dart';
import 'package:agency/constants/custom_size.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static TextButtonThemeData gnbTextButton = TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(Colors.black87),
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
    ),
  );

  static TextButtonThemeData textButton1 = TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.black87;
        }
        return Colors.black38;
      }),
    ),
  );

  static TextButtonThemeData categoryButton = TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.black87;
        }
        return Colors.black38;
      }),
    ),
  );

  static TextButtonThemeData categoryButtonSelected = TextButtonThemeData(
      style: categoryButton.style?.copyWith(
          foregroundColor: MaterialStateProperty.all(Colors.black87)));

  static TextButtonThemeData textButton2 = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(CustomColor.primary),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.white54;
        }
        return Colors.white;
      }),
      shape: MaterialStateProperty.all(const ContinuousRectangleBorder()),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: CustomSize.x * 3,
          horizontal: CustomSize.xx,
        ),
      ),
    ),
  );
}
