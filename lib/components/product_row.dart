import 'package:flutter/cupertino.dart';
import 'package:tokosmile/components/product_item.dart';

import '../data/data_classes.dart';

class ProductRow extends StatelessWidget {
  final List<Product> pair;

  const ProductRow({
    super.key,
    required this.pair,
  });

  @override
  Widget build(BuildContext context) {
    var isFull = pair.length == 2;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ProductItem(product: pair[0]),
        ),
        const SizedBox(width: 4.0),
        Expanded(
          flex: 1,
          child: isFull ? ProductItem(product: pair[1]) : const SizedBox(),
        ),
      ],
    );
  }
}
