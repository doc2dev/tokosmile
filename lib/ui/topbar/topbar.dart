import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';
import 'package:tokosmile/ui/constants.dart';
import 'package:tokosmile/ui/topbar/badge.dart';

import 'rounded_corner.dart';

class TopBar extends StatelessWidget {
  final double alpha;

  const TopBar({super.key, required this.alpha});

  @override
  Widget build(BuildContext context) {
    var opacity = min(alpha, 1.0);
    var colors = context.colors();
    var outlineColor = colors.outline;
    var secondaryColor = colors.secondary;
    var hintStyle =
        context.textTheme().labelLarge!.copyWith(color: outlineColor);

    return Container(
      color: context.colors().background.withOpacity(opacity),
      height: kTopBarHeight,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 14,
                  child: Container(
                    height: 48,
                    decoration: roundedCorner(
                      radius: 6.0,
                      borderColor: outlineColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 16.0),
                        Icon(
                          Icons.search_outlined,
                          size: 28.0,
                          color: outlineColor,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Search...',
                              hintStyle: hintStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      PinkBadge(
                        iconData: Icons.shopping_bag_outlined,
                        badgeLabel: "1",
                      ),
                      PinkBadge(
                        iconData: Icons.comment_outlined,
                        badgeLabel: "9+",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
