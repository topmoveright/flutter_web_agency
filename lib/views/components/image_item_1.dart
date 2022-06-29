import 'package:agency/constants/custom_size.dart';
import 'package:agency/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageItem1 extends StatefulWidget {
  final double itemWidth;
  final Image image;

  const ImageItem1({
    Key? key,
    required this.image,
    this.itemWidth = 400.0,
  }) : super(key: key);

  @override
  State<ImageItem1> createState() => _ImageItem1State();
}

class _ImageItem1State extends State<ImageItem1> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (value) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          _hovered = false;
        });
      },
      child: SizedBox(
        width: widget.itemWidth,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 10,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _hovered ? 0.5 : 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.image.image,
                    ),
                  ),
                ),
              ),
            ),
            const AspectRatio(aspectRatio: 16 / 1),
            AspectRatio(
              aspectRatio: 16 / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MockData.title,
                    style: Get.textTheme.titleLarge,
                  ),
                  const SizedBox(height: CustomSize.x),
                  Text(MockData.midText,
                      style: Get.textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: CustomSize.x * 2),
                  Text(
                    '2022-02-22',
                    style: Get.textTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
