import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:selfcare_app/models/category_model.dart';
import 'package:selfcare_app/providers/category_provider.dart';
import 'package:selfcare_app/widgets/category_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<Category> category = ref.watch(categoryProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    'You currently have 4 product(s)',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.normal
                    )
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Row(
                children: category.indexed.map((item) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push('/category/${item.$2.id}');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: CategoryCard(length: category.length,index: item.$1,),
                      ),
                    )
                  );
                }).toList(),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}