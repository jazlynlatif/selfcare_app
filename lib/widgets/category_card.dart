import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/models/category_model.dart';

class CategoryCard extends ConsumerWidget {
  final Category category;
  final int length;
  final bool? nonColor;
  const CategoryCard({
    super.key,
    required this.category,
    required this.length,
    this.nonColor
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    // final List<Category> category = ref.watch(categoryProvider);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      decoration: BoxDecoration(
        color: nonColor == null ? theme.colorScheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: nonColor == null ? theme.colorScheme.primary : Colors.black
        )
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
                category.image_path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              category.title,
              style: theme.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}

