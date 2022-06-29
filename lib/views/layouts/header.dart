import 'package:agency/constants/const_paths.dart';
import 'package:agency/constants/custom_size.dart';
import 'package:agency/constants/custom_theme.dart';
import 'package:agency/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends GetResponsiveView {
  final double pcWidth;

  Header({Key? key, this.pcWidth = CustomSize.defaultScreenWidth})
      : super(key: key);

  @override
  Widget? builder() {
    switch (screen.screenType) {
      case ScreenType.Watch:
      case ScreenType.Phone:
      case ScreenType.Tablet:
        return buildHeaderMobile();
      case ScreenType.Desktop:
        return buildHeaderDesktop();
    }
  }

  Widget buildHeaderMobile() {

    Widget _menu(String route, String title) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Get.toNamed(route),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
          horizontal: CustomSize.xxx, vertical: CustomSize.xx),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildLogo(),
          IconButton(
            onPressed: () => Get.dialog(
              GestureDetector(
                onTap: () => Get.back(),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _menu(Routes.home, 'Home'),
                           const SizedBox(height: CustomSize.xx),
                          _menu(Routes.aboutMe, 'AboutMe'),
                           const SizedBox(height: CustomSize.xx),
                          _menu(Routes.work, 'Work'),
                           const SizedBox(height: CustomSize.xx),
                          _menu(Routes.contact, 'Contact'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              barrierColor: Colors.black87,
            ),
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderDesktop() {
    return SizedBox(
      width: pcWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildLogo(),
          const Spacer(),
          const SizedBox(width: CustomSize.xx),
          TextButton(
              style: CustomTheme.gnbTextButton.style,
              onPressed: () => Get.toNamed(Routes.home),
              child: Text('home'.toUpperCase())),
          const SizedBox(width: CustomSize.xx),
          TextButton(
              style: CustomTheme.gnbTextButton.style,
              onPressed: () => Get.toNamed(Routes.aboutMe),
              child: Text('about me'.toUpperCase())),
          const SizedBox(width: CustomSize.xx),
          TextButton(
              style: CustomTheme.gnbTextButton.style,
              onPressed: () => Get.toNamed(Routes.work),
              child: Text('work'.toUpperCase())),
          const SizedBox(width: CustomSize.xx),
          TextButton(
              style: CustomTheme.gnbTextButton.style,
              onPressed: () => Get.toNamed(Routes.contact),
              child: Text('contact'.toUpperCase())),
        ],
      ),
    );
  }

  Widget buildLogo() => Image.asset(
        '${ConstPaths.logoImage}/t-dot.png',
        height: 50,
      );
}
