import 'package:flutter/material.dart';
import 'package:tokosmile/data/data_classes.dart';
import 'package:tokosmile/theme/theme.dart';
import 'package:tokosmile/ui/topbar/rounded_corner.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  const ProductDetailView({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late int _selectedImageIndex;

  @override
  void initState() {
    super.initState();
    _selectedImageIndex = 0;
  }

  void _updateSelection(int index) {
    setState(() {
      _selectedImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var outline = context.colors().outline;
    var images = widget.product.images;
    var indices = List.generate(images.length, (i) => i);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: AspectRatio(
        aspectRatio: 397 / 377,
        child: Container(
          decoration: roundedCorner(
            radius: 6.0,
            bgColor: outline.withOpacity(0.2),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset(
                    images[_selectedImageIndex],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  decoration: roundedCorner(
                    radius: 6.0,
                    bgColor: Colors.black.withOpacity(0.4),
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: indices
                        .map(
                          (e) => Column(
                            children: [
                              GestureDetector(
                                onTap: () => _updateSelection(e),
                                child: Container(
                                  height: 64,
                                  width: 64,
                                  decoration: roundedCorner(
                                    radius: 6.0,
                                  ),
                                  child: Image.asset(
                                    images[e],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
