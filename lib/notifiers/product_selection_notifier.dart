import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSelection extends Notifier<Set<String>> {
  @override
  Set<String> build() => {};

  void toggleSelection(String productId) {
    if(state.contains(productId)){
      state = { ...state }..remove(productId);
    } else {
      state = { ...state, productId };
    }
  }

  void clearSelection() {
    state = {};
  }
}

final productSelectionController = NotifierProvider.autoDispose<ProductSelection, Set<String>>(
  () => ProductSelection(),
);