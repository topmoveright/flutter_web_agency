import 'package:agency/constants/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabContent extends StatefulWidget {
  final Map<String, Widget> contents;
  final double maxWidth;
  final double maxHeight;

  const TabContent({
    Key? key,
    required this.contents,
    this.maxWidth = 600.0,
    this.maxHeight = 100.0,
  }) : super(key: key);

  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.contents.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: widget.maxWidth),
          child: TabBar(
            labelColor: Colors.black54,
            labelStyle: Get.textTheme.bodyLarge!,
            indicatorColor: CustomColor.primary,
            labelPadding: const EdgeInsets.all(8),
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            tabs: List.generate(
                widget.contents.keys.length,
                (index) =>
                    Text(widget.contents.keys.toList()[index].toUpperCase())),
          ),
        ),
        Container(
          constraints:
              BoxConstraints(maxWidth: widget.maxWidth, maxHeight: widget.maxHeight),
          child: DefaultTextStyle(
            style: Get.textTheme.bodyLarge!.copyWith(height: 1.5),
            child: TabBarView(
              controller: _tabController,
              children: List.generate(widget.contents.values.length,
                  (index) => widget.contents.values.toList()[index]),
            ),
          ),
        ),
      ],
    );
  }
}
