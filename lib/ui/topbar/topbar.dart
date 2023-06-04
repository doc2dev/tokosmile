import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';

class TopBar extends StatelessWidget {
  final double alpha;

  const TopBar({super.key, required this.alpha});

  @override
  Widget build(BuildContext context) {
    var opacity = min(alpha, 1.0);
    return Container(
      color: context.colors().background.withOpacity(opacity),
      height: 120,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            color: Colors.blue,
            child: Text("Top bar UI goes here"),
          )
        ],
      ),
    );
  }
}
