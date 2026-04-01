import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/models/category_model.dart';
import 'package:selfcare_app/providers/category_provider.dart';

class CategoryProductPage extends ConsumerStatefulWidget {
  final int careId;
  const CategoryProductPage({
    super.key,
    required this.careId
  });

  @override
  ConsumerState<CategoryProductPage> createState() => _CategoryProductPageState();
}

class _CategoryProductPageState extends ConsumerState<CategoryProductPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final catData = ref.watch(categoryItemProvider(widget.careId));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catData.title,
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