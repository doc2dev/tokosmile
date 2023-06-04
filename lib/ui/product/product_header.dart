import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';
import 'package:tokosmile/ui/constants.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
      height: kProductHeaderHeight,
      color: Colors.lightGreen,
      child: Center(
        child: Text("Product header content goes here"),
      ),
      /*child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Best Sale Product",
            style: context.textTheme().titleMedium!.copyWith(
                  color: context.colors().secondary,
                ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: context.textTheme().bodyLarge!.copyWith(
                color: context.colors().primary,
              ),
            ),
            onPressed: () {},
            child: const Text('See more'),
          )
        ],
      ),*/
    );
  }
}
