import 'package:agency/constants/custom_size.dart';
import 'package:agency/constants/custom_theme.dart';
import 'package:flutter/material.dart';

class PreNextButtonBar extends StatelessWidget {
  final VoidCallback? preOnPressed;
  final VoidCallback? menuOnPressed;
  final VoidCallback? nextOnPressed;

  const PreNextButtonBar({
    Key? key,
    required this.preOnPressed,
    required this.menuOnPressed,
    required this.nextOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: CustomSize.xxx,
      child: TextButtonTheme(
        data: CustomTheme.textButton1,
        child: Center(
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: preOnPressed,
                icon: const Icon(Icons.chevron_left),
                label: const Text('PREVIOUS'),
              ),
              IconButton(
                onPressed: menuOnPressed,
                icon: const Icon(Icons.grid_view_rounded),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: nextOnPressed,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('NEXT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
