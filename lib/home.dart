import 'package:flutter/material.dart';
import 'package:tokosmile/data/sample_data.dart';
import 'package:tokosmile/ui/carousel/carousel_sliver.dart';
import 'package:tokosmile/ui/product/product_container.dart';
import 'package:tokosmile/ui/product/product_header_sliver.dart';
import 'package:tokosmile/ui/product/product_list.dart';
import 'package:tokosmile/ui/topbar/topbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _scrollProgress = 0.0;

  void _updateScrollProgress(double progress) {
    setState(() {
      _scrollProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                CarouselSliver(
                  items: sampleCarousel,
                  onScrollChange: _updateScrollProgress,
                ),
              ];
            },
            body: ProductList(products: sampleProducts),
          ),
          /*CustomScrollView(
            slivers: [
              CarouselSliver(
                items: sampleCarousel,
                onScrollChange: _updateScrollProgress,
              ),
              ProductHeaderSliver(),
              ProductList(products: sampleProducts),
            ]
          ),*/
          TopBar(
            alpha: _scrollProgress * 2,
          ),
        ],
      ),
    );
  }
}
