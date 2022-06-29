import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkSquare extends StatefulWidget {
  final Color hoverColor;
  final ImageProvider? imageProvider;
  final int hoverMillisecond;
  final double hoverOpacity;
  final String title;
  final String subTitle;
  final Color fontColor;

  const WorkSquare({
    Key? key,
    this.imageProvider,
    this.hoverColor = Colors.black,
    this.hoverMillisecond = 300,
    this.hoverOpacity = 1.0,
    this.fontColor = Colors.white,
    this.title = '',
    this.subTitle = '',
  })  : assert(0.0 <= hoverOpacity && hoverOpacity <= 1.0,
            '0.0 <= hoverOpacity <= 1.0'),
        super(key: key);

  @override
  State<WorkSquare> createState() => _WorkSquareState();
}

class _WorkSquareState extends State<WorkSquare> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Container(
              decoration: widget.imageProvider != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: widget.imageProvider!,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.saturation,
                        ),
                      ),
                    )
                  : null,
            ),
            AnimatedContainer(
              width: double.maxFinite,
              height: double.maxFinite,
              padding: const EdgeInsets.all(40),
              duration: Duration(milliseconds: widget.hoverMillisecond),
              color: _isHovered
                  ? widget.hoverColor.withOpacity(widget.hoverOpacity)
                  : Colors.transparent,
              curve: Curves.easeIn,
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment:
                        _isHovered ? Alignment.center : const Alignment(0, 0.1),
                    duration: Duration(milliseconds: widget.hoverMillisecond),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedOpacity(
                          duration: _isHovered
                              ? Duration(
                                  milliseconds: widget.hoverMillisecond + 200)
                              : const Duration(milliseconds: 200),
                          opacity: _isHovered ? 1.0 : 0.0,
                          curve: Curves.easeInQuint,
                          child: Text(
                            widget.title,
                            style: Get.textTheme.headlineSmall
                                ?.copyWith(color: widget.fontColor),
                          ),
                        ),
                        const SizedBox(height: 8),
                        AnimatedOpacity(
                          duration: _isHovered
                              ? Duration(
                                  milliseconds: widget.hoverMillisecond + 400)
                              : const Duration(milliseconds: 200),
                          curve: Curves.easeInQuint,
                          opacity: _isHovered ? 1.0 : 0.0,
                          child: Text(
                            widget.subTitle,
                            style: Get.textTheme.bodyMedium?.copyWith(
                                color: widget.fontColor.withOpacity(0.8)),
                          ),
                        ),
                      ],
                    ),
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
