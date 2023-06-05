import 'package:flutter/material.dart';
import 'package:tokosmile/data/data_classes.dart';
import 'package:tokosmile/theme/theme.dart';

typedef OnProductItemClick = void Function(Product product);

class ProductItem extends StatelessWidget {
  final Product product;
  final OnProductItemClick onProductItemClick;

  const ProductItem({
    super.key,
    required this.product,
    required this.onProductItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        onTap: () { onProductItemClick(product); },
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 172 / 117,
                      child: Image.asset(
                        product.images[0],
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Positioned(
                      top: 4.0,
                      right: 4.0,
                      child: Icon(
                        Icons.favorite_border_outlined,
                        size: 24.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    product.category,
                    style: context
                        .textTheme()
                        .bodyMedium!
                        .copyWith(color: context.colors().outline),
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 4.0,
                  ),
                  child: Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme().titleSmall!.copyWith(
                          color: context.colors().secondary,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                const Spacer(flex: 1),
                Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFEA9A3A),
                              size: 12.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              "${product.avgRating} | ${product.numOfReviews}",
                              style: context
                                  .textTheme()
                                  .bodySmall!
                                  .copyWith(color: context.colors().outline),
                            ),
                          ],
                        ),
                        const Spacer(flex: 1),
                        Text(
                          "\$${product.price}",
                          style: context
                              .textTheme()
                              .titleMedium!
                              .copyWith(color: context.colors().primary),
                        ),
                        const SizedBox(width: 12.0),
                      ],
                    )),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
