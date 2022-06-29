import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBox1 extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final String subtitle;
  final TextStyle? subtitleTextStyle;
  final double textMaxWidth;
  final bool whiteBg;
  final bool alignCenter;

  const TextBox1({
    Key? key,
    required this.title,
    this.titleTextStyle,
    this.subtitle = '',
    this.subtitleTextStyle,
    this.textMaxWidth = 600.0,
    this.whiteBg = false,
    this.alignCenter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          alignCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment:
          alignCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleTextStyle ??
              (Get.textTheme.headlineMedium
                  ?.copyWith(color: whiteBg ? null : Colors.white)),
        ),
        const SizedBox(height: 16),
        subtitle.isEmpty
            ? const SizedBox.shrink()
            : SizedBox(
                width: textMaxWidth,
                child: Text(
                  subtitle,
                  style: subtitleTextStyle ??
                      (Get.textTheme.headline6
                          ?.copyWith(color: whiteBg ? null : Colors.white)),
                  textAlign: alignCenter ? TextAlign.center : TextAlign.left,
                ),
              ),
      ],
    );
  }
}
