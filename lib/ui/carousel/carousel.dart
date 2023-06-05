import 'dart:async';

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
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller = PageController(
      initialPage: _currentPage,
    );
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      var page = _currentPage + 1;
      if (page >= 2) page = 0;
      _controller.animateToPage(
        page,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
      );
    });
    _controller.addListener(() {
      var page = _controller.page ?? 0.0;
      _setCurrentPage(page.ceil());
    });
  }

  void _setCurrentPage(int page) {
    setState(() {
      _currentPage = page;
    });
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
    _timer.cancel();
    super.dispose();
  }
}
