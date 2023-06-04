import 'package:flutter/material.dart';

import '../../data/data_classes.dart';
import 'product_row.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  State<StatefulWidget> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    /*_scrollController.addListener(() {
      print("Current scroll: ${_scrollController.offset}");
    });*/
  }

  List<List<Product>> getPairs() {
    var pairs = <List<Product>>[];
    for (var element in widget.products) {
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
    /*return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ProductRow(pair: pairs[index]);
        },
        childCount: pairs.length,
      ),
    );*/
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: pairs.length,
        shrinkWrap: true,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return ProductRow(pair: pairs[index]);
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
