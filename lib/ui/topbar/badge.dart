import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';
import 'package:tokosmile/ui/topbar/rounded_corner.dart';

class PinkBadge extends StatelessWidget {
  final IconData iconData;
  final String badgeLabel;

  const PinkBadge({
    super.key,
    required this.iconData,
    required this.badgeLabel,
  });

  @override
  Widget build(BuildContext context) {
    var colors = context.colors();
    var secondaryColor = colors.secondary;
    var tertiaryColor = colors.tertiary;
    var style = context.textTheme().bodySmall!.copyWith(
          color: colors.onTertiary,
      fontSize: 9.0,
        );

    return SizedBox(
      width: 48.0,
      height: 48.0,
      child: Stack(
        children: [
          Center(
            child: Icon(
              iconData,
              size: 28.0,
              color: secondaryColor,
            ),
          ),
          Positioned(
            bottom: 24.0,
            right: 5.0,
            child: Container(
              width: 18.0,
              height: 12.0,
              decoration: roundedCorner(
                radius: 3.0,
                bgColor: tertiaryColor,
              ),
              child: Center(
                child: Text(
                  badgeLabel,
                  style: style,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
