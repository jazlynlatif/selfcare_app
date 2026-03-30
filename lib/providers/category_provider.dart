import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/data/category_data.dart';
import 'package:selfcare_app/models/category.dart';

final categoryProvider = Provider<List<Category>>(
  (ref) {
    return categoryData;
  }
);