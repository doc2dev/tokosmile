import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tokosmile/data/sample_data.dart';
import 'package:tokosmile/ui/product/product_header.dart';
import 'package:tokosmile/ui/product/product_list.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProductHeader(),
          ProductList(products: sampleProducts),
        ],
      ),
    );
  }
}
