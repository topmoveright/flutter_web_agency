import 'package:agency/constants/custom_size.dart';
import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  const Section({
    Key? key,
    required this.child,
    this.decoration,
    this.backgroundImage,
    this.whiteBg = false,
    this.padding = const EdgeInsets.all(CustomSize.xxx),
  }) : super(key: key);

  final Widget child;
  final Decoration? decoration;
  final Image? backgroundImage;
  final bool whiteBg;
  final EdgeInsetsGeometry padding;

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  final GlobalKey _backgroundImageKey = GlobalKey();
  final GlobalKey _childKey = GlobalKey();

  double? childHeight;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var childBox = _childKey.currentContext?.findRenderObject() as RenderBox;
      setState(() {
        childHeight = childBox.size.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: widget.decoration,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildParallaxBackground(
            context,
            widget.whiteBg,
            widget.backgroundImage,
            childHeight,
          ),
          Container(
            key: _childKey,
            padding: widget.padding,
            child: widget.child,
          ),
        ],
      ),
    );
  }

  Widget _buildParallaxBackground(
    BuildContext context,
    bool whiteBg,
    Image? backgroundImage,
    double? height,
  ) {
    return backgroundImage != null && childHeight != null
        ? SizedBox(
            height: height,
            child: Flow(
              delegate: ParallaxFlowDelegate(
                scrollable: Scrollable.of(context)!,
                listItemContext: context,
                backgroundImageKey: _backgroundImageKey,
              ),
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    key: _backgroundImageKey,
                    height: height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.5,
                        image: backgroundImage.image,
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                        colorFilter: whiteBg
                            ? null
                            : const ColorFilter.mode(
                                Colors.black54,
                                BlendMode.darken,
                              ),
                      ),
                    ),
                  ),
                ),
                /*AspectRatio(
                  aspectRatio: 16/9,
                  child: Image.network(
                    bgUrl!,
                    key: _backgroundImageKey,
                    fit: BoxFit.fitHeight,
                    alignment: FractionalOffset.topCenter,
                  ),
                ),*/
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
