import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/models/view_product_model.dart';
import 'package:selfcare_app/notifiers/product_selection_notifier.dart';

class ProductCard extends ConsumerStatefulWidget {
  final ViewProduct product;
  const ProductCard({
    super.key,
    required this.product
  });

  @override
  ConsumerState<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends ConsumerState<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final product = widget.product;
    final isSelected = ref.watch(productSelectionController.select((ids) => ids.contains(product.product.id.toString())));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Ink(
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(
            color: Color.fromRGBO(218, 218, 218, 1),
          ),
          borderRadius: BorderRadius.circular(5)
        ),
        child: InkWell(
          onLongPress: () {
            ref.read(productSelectionController.notifier).toggleSelection(product.product.id.toString());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.product.name,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${product.category} - ${product.type}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.normal
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '${product.product.size}${product.sizeUnit}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(141, 141, 141, 1)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}