import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/data/product_data.dart';
import 'package:selfcare_app/data/product_type_data.dart';
import 'package:selfcare_app/data/size_unit_data.dart';
import 'package:selfcare_app/models/product_model.dart';
import 'package:selfcare_app/models/product_type_model.dart';
import 'package:selfcare_app/models/size_unit_model.dart';
import 'package:selfcare_app/models/view_product_model.dart';
import 'package:selfcare_app/providers/category_provider.dart';

final productProvider = Provider<List<Product>>(
  (ref) {
    return productData;
  }
);

final productTypeProvider = Provider.family<List<ProductType>, int> (
  (ref, catId) {
    return catId == 0 ? productTypeData : productTypeData.where((type) => type.categoryId == catId).toList();
  }
);

final productSizeUnitProvider = Provider<List<SizeUnit>> (
  (ref) {
    return sizeUnitData;
  }
);

final productCatProvider = Provider.family<List<ViewProduct>, int> (
  (ref, catId) {
    final rawData = ref.watch(productProvider);
    final rawCatData = catId != 0 ? rawData.where((product) => product.categoryId == catId).toList() : rawData;
    final productCategory = ref.watch(categoryProvider);
    final productTypeData = ref.watch(productTypeProvider(catId));
    final productSizeUnitData = ref.watch(productSizeUnitProvider);

    final finalData = rawCatData.map((product) {
      final category = productCategory.firstWhere((cat) => cat.id == product.categoryId); // change to product.catId when cat "All" id is sorted
      final type = productTypeData.firstWhere((type) => type.id == product.typeId);
      final sizeUnit = productSizeUnitData.firstWhere((unit) => unit.id == product.sizeUnitId);
      return ViewProduct(
        product: product, 
        category: category.title, 
        type: type.name, 
        sizeUnit: sizeUnit.name
      );
    }).toList();

    return finalData;
  }
);
