import 'package:flutter/material.dart';
import 'package:tokosmile/ui/constants.dart';
import 'package:tokosmile/ui/product/product_header.dart';

class ProductHeaderSliver extends StatelessWidget {
  const ProductHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ActionPanelDelegate(),
      pinned: false,
      floating: false,
    );
  }
}

class _ActionPanelDelegate extends SliverPersistentHeaderDelegate {

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return ProductHeader();
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}