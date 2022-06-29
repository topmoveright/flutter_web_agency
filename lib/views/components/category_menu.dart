import 'package:agency/constants/custom_size.dart';
import 'package:agency/constants/custom_theme.dart';
import 'package:flutter/material.dart';

class CategoryMenu extends StatelessWidget {
  final List<TextButton> list;
  final bool centerAlign;
  final int selectedIndex;

  const CategoryMenu({
    Key? key,
    required this.list,
    this.centerAlign = true,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CustomSize.xx * 3,
      child: Wrap(
        alignment: centerAlign ? WrapAlignment.center : WrapAlignment.start,
        runAlignment: WrapAlignment.center,
        spacing: CustomSize.xx,
        children: [
          for (var i = 0; i < list.length; i++)
            TextButton(
              onPressed: list[i].onPressed,
              child: list[i].child ?? const SizedBox.shrink(),
              style: selectedIndex == i
                  ? CustomTheme.categoryButtonSelected.style
                  : CustomTheme.categoryButton.style,
            )
        ],
      ),
    );
  }
}
