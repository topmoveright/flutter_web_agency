import 'package:agency/constants/const_paths.dart';
import 'package:agency/constants/custom_color.dart';
import 'package:agency/constants/custom_size.dart';
import 'package:agency/models/skills.dart';
import 'package:flutter/material.dart';

class TextList1 extends StatelessWidget {
  const TextList1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _item({
      required String imagePath,
      required String title,
      required String percentage,
      required double value,
    }) {
      return SizedBox(
        width: 300,
        child: ListTile(
          leading: Image.asset(imagePath),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
              Text(
                percentage,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          subtitle: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(CustomColor.primary),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CustomSize.xx),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 40,
          runSpacing: 40,
          children: [
            _item(
              imagePath:
                  '${ConstPaths.logoImage}/${SkillType.flutter.name}.png',
              title: 'Favorite',
              percentage: '99.99%',
              value: 0.99,
            ),
            _item(
              imagePath:
                  '${ConstPaths.logoImage}/${SkillType.javascript.name}.png',
              title: 'Awesome',
              percentage: '70.0%',
              value: 0.7,
            ),
            _item(
              imagePath: '${ConstPaths.logoImage}/${SkillType.strapi.name}.png',
              title: 'Like it',
              percentage: '50.0%',
              value: 0.5,
            ),
            _item(
              imagePath: '${ConstPaths.logoImage}/${SkillType.php.name}.png',
              title: '...',
              percentage: '0.1%',
              value: 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
