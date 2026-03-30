import 'package:flutter/material.dart';
import 'package:selfcare_app/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category item;
  final int length;
  const CategoryWidget({
    super.key,
    required this.item,
    required this.length
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
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
                item.image_path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              item.title,
              style: theme.textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}

