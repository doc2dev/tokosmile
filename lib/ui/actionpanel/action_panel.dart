import 'package:flutter/material.dart';
import 'package:tokosmile/ui/constants.dart';

class ActionPanel extends StatelessWidget {
  const ActionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width,
      height: kActionPanelHeight,
      child: Center(
        child: Text("Action panel icons go here"),
      ),
    );
  }

}