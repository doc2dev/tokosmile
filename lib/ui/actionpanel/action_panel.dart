import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';
import 'package:tokosmile/ui/constants.dart';
import 'package:tokosmile/ui/topbar/rounded_corner.dart';

class ActionPanel extends StatelessWidget {
  const ActionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = context.colors();
    var outline = colors.outline;
    var secondary = colors.secondary;
    var icons = [
      [Icons.category_outlined, "Category"],
      [Icons.flight, "Flight"],
      [Icons.assignment, "Bill"],
      [Icons.language, "Data Plan"],
      [Icons.paid_outlined, "Top Up"],
    ];
    var labelStyle = context.textTheme().bodySmall!.copyWith(
          color: outline,
        );
    List<Widget> children = icons
        .map((e) => Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: roundedCorner(
                    radius: 6,
                    bgColor: outline.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Icon(
                      e[0] as IconData,
                      size: 24,
                      color: secondary.withOpacity(0.8),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  e[1] as String,
                  style: labelStyle,
                )
              ],
            ))
        .toList();

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      height: kActionPanelHeight,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ],
      ),
    );
  }
}
