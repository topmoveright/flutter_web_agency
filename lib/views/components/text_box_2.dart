import 'package:agency/constants/custom_size.dart';
import 'package:flutter/material.dart';

class TextBox2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final double textMaxWidth;

  const TextBox2({
    Key? key,
    required this.title,
    required this.subtitle,
    this.textMaxWidth = 600.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CustomSize.xxx),
      child: Row(
        children: [
          Flexible(flex: 1, child: Container()),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 40,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(height: CustomSize.xx),
                Container(
                  constraints: BoxConstraints(maxWidth: textMaxWidth),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: subtitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                        height: 3.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
