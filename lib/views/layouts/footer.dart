import 'package:agency/constants/content.dart';
import 'package:agency/constants/custom_size.dart';
import 'package:agency/routes.dart';
import 'package:agency/views/components/section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends GetResponsiveView {
  Footer({Key? key}) : super(key: key);

  @override
  Widget? builder() {
    return Section(
      decoration: const BoxDecoration(color: Colors.black87),
      child: DefaultTextStyle(
        style: Get.textTheme.titleMedium!
            .copyWith(color: Colors.white60, height: 1.8),
        child: Builder(builder: (context) {
          switch (screen.screenType) {
            case ScreenType.Watch:
            case ScreenType.Phone:
            case ScreenType.Tablet:
              return SizedBox(
                width: CustomSize.defaultScreenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildMenu(),
                    const SizedBox(height: CustomSize.xx),
                    buildSNS(),
                    const SizedBox(height: CustomSize.xx),
                    buildInfo(),
                  ],
                ),
              );
            case ScreenType.Desktop:
              return SizedBox(
                width: CustomSize.defaultScreenWidth,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildMenu(),
                        buildSNS(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buildInfo(),
                      ],
                    ),
                  ],
                ),
              );
          }
        }),
      ),
    );
  }

  Column buildSNS() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => launchUrl(Uri.parse(Content.gitHubUrl)),
            child: const Text(
              'GitHub',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMenu() {
    Widget _menu(String route, String title) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Get.toNamed(route),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _menu(Routes.home, 'Home'),
        _menu(Routes.aboutMe, 'AboutMe'),
        _menu(Routes.work, 'Work'),
        _menu(Routes.contact, 'Contact'),
      ],
    );
  }

  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        /*Text('Piroll Design, Inc.'),
        SizedBox(height: CustomSize.x * 2),*/
        Text(
          '© 2022. ${Content.mailAddress}. All rights reserved.',
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 16,
          ),
        ),
        //Text('+82 123 1234'),
        //SizedBox(height: CustomSize.x * 2),
      ],
    );
  }
}
