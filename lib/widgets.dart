import 'package:flutter/material.dart';

class Widgets {
  Widgets._();

  static mouseClickOnTap({
    required GestureTapCallback? onTap,
    required Widget child,
  }) =>
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(onTap: onTap, child: child),
      );
}
