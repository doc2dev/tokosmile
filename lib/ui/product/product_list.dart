import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';

import '../../data/data_classes.dart';
import 'product_row.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  List<List<Product>> getPairs() {
    var pairs = <List<Product>>[];
    for (var element in products) {
      if (pairs.isEmpty) {
        pairs.add([]);
      }
      if (pairs.last.length < 2) {
        pairs.last.add(element);
      } else {
        pairs.add([element]);
      }
    }
    return pairs;
  }

  @override
  Widget build(BuildContext context) {
    var pairs = getPairs();
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      color: context.colors().surfaceVariant,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pairs.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ProductRow(pair: pairs[index]);
        },
      ),
    );
  }
}