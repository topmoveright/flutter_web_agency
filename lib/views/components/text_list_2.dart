import 'package:agency/constants/custom_size.dart';
import 'package:agency/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextList2 extends StatelessWidget {
  const TextList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 40,
        runSpacing: 40,
        children: List.generate(
          4,
          (index) => SizedBox(
            width: 250,
            child: Column(
              children: [
                const Icon(
                  Icons.admin_panel_settings_rounded,
                  color: Colors.white,
                  size: CustomSize.xxx,
                ),
                const SizedBox(height: CustomSize.x * 2),
                Text(
                  MockData.title.toUpperCase(),
                  style: Get.textTheme.subtitle1!.copyWith(color: Colors.white),
                ),
                const SizedBox(height: CustomSize.x),
                Text(
                  MockData.shortText,
                  style:
                      Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
