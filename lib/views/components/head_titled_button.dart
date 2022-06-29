import 'package:agency/constants/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadTitledButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final String buttonText;
  final double textMaxWidth;
  final bool alignCenter;
  final bool whiteBg;

  const HeadTitledButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.buttonText,
    this.textMaxWidth = 600.0,
    this.alignCenter = true,
    this.whiteBg = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          alignCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Get.textTheme.headlineMedium
                ?.copyWith(color: whiteBg ? null : Colors.white)),
        const SizedBox(height: 24),
        Container(
          constraints: BoxConstraints(maxWidth: textMaxWidth),
          child: Text(subtitle,
              style: Get.textTheme.bodyMedium
                  ?.copyWith(color: whiteBg ? null : Colors.white)),
        ),
        const SizedBox(height: 24),
        TextButton(
          style: CustomTheme.textButton2.style,
          onPressed: onPressed,
          child: Text(buttonText.toUpperCase()),
        ),
      ],
    );
  }
}
