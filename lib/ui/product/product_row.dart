import 'package:flutter/material.dart';

import '../../data/data_classes.dart';
import 'product_item.dart';

class ProductRow extends StatelessWidget {
  final List<Product> pair;
  final OnProductItemClick onProductItemClick;

  const ProductRow({
    super.key,
    required this.pair,
    required this.onProductItemClick,
  });

  @override
  Widget build(BuildContext context) {
    var isFull = pair.length == 2;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ProductItem(
            product: pair[0],
            onProductItemClick: onProductItemClick,
          ),
        ),
        const SizedBox(width: 4.0),
        Expanded(
          flex: 1,
          child: isFull
              ? ProductItem(
                  product: pair[1],
                  onProductItemClick: onProductItemClick,
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
