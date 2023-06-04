import 'package:flutter/material.dart';
import 'package:tokosmile/ui/carousel/carousel_item.dart';

import '../../data/data_classes.dart';

class Carousel extends StatefulWidget {
  final List<CarouselData> items;

  const Carousel({super.key, required this.items});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _controller;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller = PageController(
      initialPage: _currentPage,
    );
  }

  @override
  Widget build(context) {
    return PageView(
      controller: _controller,
      children: [
        CarouselItem(carouselData: widget.items[0]),
        CarouselItem(carouselData: widget.items[1]),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}