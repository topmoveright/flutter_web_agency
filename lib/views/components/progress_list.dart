import 'package:agency/constants/custom_color.dart';
import 'package:agency/constants/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressList extends StatelessWidget {
  final String title;
  final Map<String, double> listContent;

  const ProgressList({
    Key? key,
    required this.title,
    required this.listContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return       Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Get.textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: CustomSize.x * 2),
        ...List.generate(
          listContent.keys.length,
              (index) {
            var title = listContent.keys.toList()[index];
            var value = listContent.values.toList()[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: CustomSize.x * 3),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(title,
                          style: Get.textTheme.bodyMedium
                              ?.copyWith(color: Colors.white)),
                      const SizedBox(width: CustomSize.x * 2),
                      Text('${value * 100}%',
                          style: Get.textTheme.bodyMedium
                              ?.copyWith(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: CustomSize.x * 2),
                  LinearProgressIndicator(
                    color: CustomColor.primary,
                    backgroundColor: Colors.grey[400],
                    value: value,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
