import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';

class CenterDot extends StatefulWidget {
  const CenterDot({Key? key}) : super(key: key);

  @override
  State<CenterDot> createState() => _CenterDotState();
}

class _CenterDotState extends State<CenterDot> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Text(
          "●",
          style: TextStyle(
            color: context.colors().outline,
          ),
        ),
      ),
    );
  }
}
