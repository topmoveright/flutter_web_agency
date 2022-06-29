import 'package:agency/constants/custom_size.dart';
import 'package:agency/models/skills.dart';
import 'package:agency/views/components/carousel.dart';
import 'package:agency/views/components/section.dart';
import 'package:agency/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetResponsiveView {
  Home({Key? key}) : super(key: key);

  @override
  Widget? builder() {
    var logoList = SkillType.values.map((e) => e.name).toList();
    logoList.shuffle();

    late double viewportFraction;
    late double fontScale;

    switch (screen.screenType) {
      case ScreenType.Watch:
      case ScreenType.Phone:
        viewportFraction = 0.4;
        fontScale = 0.6;
        break;
      case ScreenType.Tablet:
      case ScreenType.Desktop:
        viewportFraction = 0.2;
        fontScale = 1.0;
        break;
    }

    return Layout(
      child: Section(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AniText(
              text: 'portfolio'.toUpperCase(),
              spacing: 40,
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 80 * fontScale,
              ),
            ),
            const SizedBox(height: CustomSize.xx),
            Text(
              '본 사이트는 Flutter 로 제작 되었습니다.',
              style: TextStyle(
                fontSize: 40 * fontScale,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: CustomSize.xxx * 2 * fontScale),
            Text(
              '백두산이 마르고 닳도록',
              style: TextStyle(
                fontSize: 80 * fontScale,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: CustomSize.xx),
            const Text(
              'with',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w200,
                color: Colors.black38,
              ),
            ),
            const SizedBox(height: CustomSize.x),
            Carousel(
              showIndicator: false,
              viewportFraction: viewportFraction,
              autoPlay: true,
              pageSnapping: false,
              height: 100,
              contents: List.generate(
                logoList.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'images/logos/grey/${logoList[index]}.png',
                      height: 80,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AniText extends StatelessWidget {
  final String text;
  final double spacing;
  final TextStyle? textStyle;

  const AniText({
    Key? key,
    required this.text,
    this.spacing = 24,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tList = text.split('');

    return Wrap(
      spacing: spacing,
      children: List.generate(
        tList.length,
        (index) => tList[index].isEmpty
            ? const SizedBox.shrink()
            : CompAniChar(
                char: tList[index],
                textStyle: textStyle,
              ),
      ),
    );
  }
}

class CompAniChar extends StatefulWidget {
  final String char;
  final TextStyle? textStyle;

  const CompAniChar({Key? key, required this.char, this.textStyle})
      : super(key: key);

  @override
  State<CompAniChar> createState() => _CompAniCharState();
}

class _CompAniCharState extends State<CompAniChar>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation animation1;
  late AnimationController controller2;
  late Animation animation2;
  late TextStyle textStyle;

  @override
  void initState() {
    textStyle = widget.textStyle ??
        const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 80,
        );

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        if (controller1.isCompleted) {
          controller2.forward();
        }
      });

    animation1 = Tween(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: controller1, curve: Curves.easeInOutBack));

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation2 = Tween(begin: 1.0, end: 0.5)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut));

    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.grab,
      onHover: (event) {
        controller1.forward();
      },
      onExit: (event) {
        controller1.reverse();
        controller2.reverse();
      },
      child: AnimatedBuilder(
        animation: animation1,
        builder: (context, child) => Transform.scale(
          scale: animation1.value,
          child: AnimatedBuilder(
              animation: animation2,
              builder: (context, child) => Opacity(
                    opacity: animation2.value,
                    child: Text(
                      widget.char,
                      style: textStyle,
                    ),
                  )),
        ),
      ),
    );
  }
}
