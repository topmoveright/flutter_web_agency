import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<Widget> contents;
  final double width;
  final double height;
  final Color indicatorColor;
  final bool autoPlay;
  final int autoPlaySecond;
  final bool showIndicator;
  final double viewportFraction;
  final bool pageSnapping;
  final bool showPreNextButton;

  const Carousel({
    Key? key,
    required this.contents,
    this.width = double.maxFinite,
    this.height = 100.0,
    this.indicatorColor = Colors.white,
    this.autoPlay = true,
    this.autoPlaySecond = 5,
    this.showIndicator = true,
    this.viewportFraction = 1.0,
    this.pageSnapping = true,
    this.showPreNextButton = false,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final PageController _pageController;
  late final Timer _timer;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0, viewportFraction: widget.viewportFraction)
      ..addListener(() {
        _tabController.index =
            (_pageController.page?.round() ?? 0) % widget.contents.length;
      });
    _tabController = TabController(length: widget.contents.length, vsync: this);
    if (widget.autoPlay) {
      _timer =
          Timer.periodic(Duration(seconds: widget.autoPlaySecond), (timer) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.width,
              height: widget.height,
              child: PageView.builder(
                scrollBehavior: MyCustomScrollBehavior(),
                padEnds: false,
                controller: _pageController,
                pageSnapping: widget.pageSnapping,
                itemBuilder: (context, index) => Center(
                    child: widget.contents[index % widget.contents.length]),
              ),
            ),
            widget.showIndicator
                ? TabPageSelector(
                    color: widget.indicatorColor.withOpacity(0.5),
                    selectedColor: widget.indicatorColor,
                    controller: _tabController,
                  )
                : const SizedBox.shrink(),
          ],
        ),
        widget.showPreNextButton
            ? Align(
                alignment: const Alignment(-0.95, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    onPressed: () => _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        widget.showPreNextButton
            ? Align(
                alignment: const Alignment(0.95, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    onPressed: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}


// 캐러셀 드래그 처리(PointerDeviceKind.touch)
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}