import 'package:flutter/cupertino.dart';
import 'package:tokosmile/components/product_row.dart';

import '../data/data_classes.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({
    super.key,
    required this.products,
  });

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
    return ListView.builder(
      itemCount: pairs.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductRow(pair: pairs[index]);
      },
    );
  }
}
