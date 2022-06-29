import 'package:agency/constants/content.dart';
import 'package:agency/constants/custom_color.dart';
import 'package:agency/views/components/section.dart';
import 'package:agency/views/components/text_box_1.dart';
import 'package:agency/views/components/text_list_1.dart';
import 'package:agency/views/layouts/layout.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: const [
          // # Section 1
          Section(
            child: TextBox1(
              alignCenter: false,
              titleTextStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w200,
                color: CustomColor.primary,
              ),
              subtitleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                height: 2,
              ),
              title: 'Who.',
              subtitle: Content.aboutMeText1,
            ),
          ),

          // # Section 2
          Section(
            decoration: BoxDecoration(color: Colors.white),
            child: TextList1(),
          ),

          // # Section 4
          Section(
            child: TextBox1(
              alignCenter: false,
              titleTextStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w200,
                color: CustomColor.primary,
              ),
              subtitleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                height: 2,
              ),
              title: 'Vision.',
              subtitle: Content.aboutMeText2,
            ),
          ),
        ],
      ),
    );
  }
}
