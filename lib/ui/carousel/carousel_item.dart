import 'package:flutter/material.dart';
import 'package:tokosmile/data/data_classes.dart';

class CarouselItem extends StatelessWidget {
  final CarouselData carouselData;

  const CarouselItem({
    super.key,
    required this.carouselData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.asset(
              carouselData.imageFile,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}
