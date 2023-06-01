import 'package:flutter/material.dart';
import 'package:tokosmile/components/product_list.dart';
import 'package:tokosmile/data/sample_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ProductList(products: sampleProducts),
      ),
    );
  }
}
