import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';
import 'package:tokosmile/ui/productdetail/center_dot.dart';
import 'package:tokosmile/ui/productdetail/product_detail_view.dart';
import 'package:tokosmile/ui/topbar/badge.dart';

import '../../data/data_classes.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.favorite_border_outlined,
                color: context.colors().secondary,
                size: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.share,
                color: context.colors().secondary,
                size: 28,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              child: PinkBadge(
                iconData: Icons.shopping_bag_outlined,
                badgeLabel: "1",
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            ProductDetailBody(
              product: product,
            ),
            FixedBottomArea(
              product: product,
            )
          ],
        ),
      ),
    );
  }
}

class FixedBottomArea extends StatelessWidget {
  const FixedBottomArea({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    var colors = context.colors();
    var textTheme = context.textTheme();
    var priceStyle = textTheme.headlineSmall!.copyWith(
      color: context.colors().primary,
    );
    var buttonStyle = textTheme.labelLarge!.copyWith(
      color: colors.onPrimary,
    );
    var ratingStyle = textTheme.bodyLarge!.copyWith(
      color: context.colors().outline,
    );

    return Positioned(
      left: 0,
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        color: colors.background,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: ratingStyle,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    "\$${product.price}",
                    style: priceStyle,
                  ),
                ],
              ),
              const SizedBox(width: 40),
              Expanded(
                child: SizedBox(
                  height: 72.0,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6.0),
                            bottomLeft: Radius.circular(6.0),
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              color: colors.primary,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_bag_outlined,
                                      color: colors.onPrimary,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      "1",
                                      style: buttonStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(6.0),
                            bottomRight: Radius.circular(6.0),
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              color: colors.secondary,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Buy Now",
                                      style: buttonStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailBody extends StatelessWidget {
  final Product product;

  const ProductDetailBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var colors = context.colors();
    var textTheme = context.textTheme();
    var secondary = colors.secondary;
    var outline = colors.outline;
    var websiteStyle = textTheme.bodyLarge!.copyWith(
      color: outline,
    );
    var descriptionStyle = textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 28,
      color: secondary,
    );
    var ratingStyle = textTheme.bodyLarge!.copyWith(
      color: context.colors().outline,
    );
    var numReviews = (product.numOfReviews / 1000).toStringAsFixed(1);
    var soldCount = (product.itemsSold / 1000).toStringAsFixed(1);

    return Container(
      color: colors.surfaceVariant,
      child: ListView(
        children: [
          ProductDetailView(product: product),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.storefront_outlined,
                  size: 32,
                  color: outline,
                ),
                const SizedBox(width: 16),
                Text(
                  "tokobaju.id",
                  style: websiteStyle,
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              product.description,
              style: descriptionStyle,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xFFEA9A3A),
                  size: 24.0,
                ),
                const SizedBox(width: 4.0),
                Text(
                  "${product.avgRating} Rating",
                  style: ratingStyle,
                ),
                const CenterDot(),
                Text(
                  "${numReviews}k Reviews",
                  style: ratingStyle,
                ),
                const CenterDot(),
                Text(
                  "${soldCount}k Sold",
                  style: ratingStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "About Item"),
              Tab(text: "Reviews"),
            ],
          ),
        ],
      ),
    );
  }
}
