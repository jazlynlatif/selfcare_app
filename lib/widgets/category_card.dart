import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/models/category.dart';
import 'package:selfcare_app/providers/category_provider.dart';

class CategoryWidget extends ConsumerWidget {
  final int index;
  final int length;
  const CategoryWidget({
    super.key,
    required this.index,
    required this.length
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final List<Category> category = ref.watch(categoryProvider);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: screenHeight * 0.04,
              child: Image.asset(
                category[index].image_path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              category[index].title,
              style: theme.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}

