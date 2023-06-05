import 'package:flutter/material.dart';
import 'package:tokosmile/ui/actionpanel/action_panel.dart';
import 'package:tokosmile/ui/carousel/carousel.dart';
import 'package:tokosmile/ui/constants.dart';
import 'package:tokosmile/ui/product/product_header.dart';

import '../../data/data_classes.dart';

typedef OnScrollChange = void Function(double scrollProgress);

class CarouselSliver extends StatelessWidget {
  final List<CarouselData> items;
  final OnScrollChange onScrollChange;

  const CarouselSliver({
    super.key,
    required this.items,
    required this.onScrollChange,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: HeaderDelegate(
        items: items,
        onScrollChange: onScrollChange,
      ),
      pinned: true,
      //floating: true,
    );
  }
}

var _currentProgress = -1.0;

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<CarouselData> items;
  final OnScrollChange onScrollChange;

  HeaderDelegate({
    required this.onScrollChange,
    required this.items,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;
    if (progress != _currentProgress) {
      _currentProgress = progress;
      Future.delayed(Duration.zero, () {
        onScrollChange(progress);
      });
    }
    return Column(
      children: [
        Expanded(child: Carousel(items: items)),
        const ActionPanel(),
        const ProductHeader(),
      ],
    );
  }

  @override
  double get maxExtent => kCarouselLimit +
      kActionPanelHeight +
      kProductHeaderHeight;

  @override
  double get minExtent => kTopBarHeight +
      kProductHeaderHeight - 10;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

/*TODO:
* - product detail view
* - detail view entry animation
* - bloc integration
* */
