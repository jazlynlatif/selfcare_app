import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/data/product_data.dart';
import 'package:selfcare_app/models/product_model.dart';

class ProductNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [...productData];
  }

  void deleteProducts(Set<String> toDelete) {
    state = state.where((product) => !toDelete.contains(product.id.toString())).toList();

    //API
  }

  void addProducts(Product toAdd) {
    state = [...state, toAdd];

    //API
  }
}

final productController = NotifierProvider <ProductNotifier, List<Product>>(() => ProductNotifier());