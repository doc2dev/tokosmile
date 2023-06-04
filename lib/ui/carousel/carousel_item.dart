import 'package:flutter/material.dart';
import 'package:tokosmile/data/data_classes.dart';
import 'package:tokosmile/theme/theme.dart';
import 'package:tokosmile/ui/constants.dart';

class CarouselItem extends StatelessWidget {
  final CarouselData carouselData;

  const CarouselItem({
    super.key,
    required this.carouselData,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme();
    var colors = context.colors();
    var secondaryColor = colors.secondary;
    var onSecondary = colors.onSecondary;
    var hashtagStyle = textTheme.labelMedium!.copyWith(
      color: secondaryColor,
    );
    var titleStyle = textTheme.headlineMedium!.copyWith(
      color: secondaryColor,
    );
    var subtitleStyle = textTheme.labelSmall!.copyWith(
      color: secondaryColor,
    );
    var buttonStyle = textTheme.labelMedium!.copyWith(
      color: onSecondary,
    );

    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: kCarouselLimit,
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.asset(
              carouselData.imageFile,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          top: kTopBarHeight,
          width: 300.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(carouselData.hashTag, style: hashtagStyle),
              const SizedBox(height: 4.0),
              Text(carouselData.title, style: titleStyle),
              const SizedBox(height: 4.0),
              Text(carouselData.subtitle, style: subtitleStyle),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                    ),
                    backgroundColor: secondaryColor,
                ),
                onPressed: () {},
                child: Text(
                  carouselData.callToAction,
                  style: buttonStyle,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
