import 'package:flutter/material.dart';
import 'package:selfcare_app/models/category_model.dart';

class CategoryProductPage extends StatefulWidget {
  final int careId;
  const CategoryProductPage({
    super.key,
    required this.careId
  });

  @override
  State<CategoryProductPage> createState() => _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Face Care',
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              
            ],
          ),
        )
      ),
    );
  }
}