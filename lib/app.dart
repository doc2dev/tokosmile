import 'package:flutter/material.dart';
import 'package:tokosmile/ui/home/home.dart';
import 'package:tokosmile/theme/theme.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokosmile',
      theme: lightTheme,
      home: const MyHomePage(title: 'Tokosmile'),
      debugShowCheckedModeBanner: false,
    );
  }

}