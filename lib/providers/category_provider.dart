import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/data/category_data.dart';
import 'package:selfcare_app/models/category_model.dart';

final categoryProvider = Provider<List<Category>>(
  (ref) {
    return categoryData;
  }
);

final categoryItemProvider = Provider.family<Category, int>(
  (ref, id) {
    final all = ref.watch(categoryProvider);
    return all.firstWhere((cat) => cat.id ==id);
  }
);