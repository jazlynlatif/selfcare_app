import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/models/product_form_model.dart';

class ProductFormNotifier extends Notifier<ProductForm>{
  @override
  ProductForm build() {
    return ProductForm();
  }

  void updateName(String val) {
    state = state.copyWith(name: val, nameError: null);
  }

  void selectCategory(int id) {
    state = state.copyWith(categoryId: id, categoryError: null);
  }

  void selectType(int id) {
    state = state.copyWith(typeId: id, typeError: null);
  }

  void updateSize(String size) {
    state = state.copyWith(size: size, sizeError: null);
  }

  void selectSizeUnit(int id) {
    state = state.copyWith(sizeUnitId: id, sizeUnitError: null);
  }

  bool validate() {
    final String? nameError = state.name.trim().isEmpty ? "Product name is required" : null;
    final String? categoryError = state.categoryId == null ? "Please select a category" : null;
    final String? typeError = state.typeId == null ? "Please select a type" : null;
    final String? sizeError = state.size.trim().isEmpty ? "Product size is required" : null;
    final String? sizeUnitError = state.sizeUnitId == null ? "Please select a size unit" : null;

    String? sizeNumErr;
    if(sizeError == null && double.tryParse(state.size) == null) {
      sizeNumErr = "Please enter a valid number";
    }
    state = state.copyWith(
      nameError: nameError,
      categoryError: categoryError,
      typeError: typeError,
      sizeError: sizeError ?? sizeNumErr,
      sizeUnitError: sizeUnitError
    );

    return nameError == null && categoryError == null && typeError == null && (sizeError == null && sizeNumErr == null) && sizeUnitError == null;
  }

  void reset() {
    state = ProductForm.initial;
  }
 
  Future <void> submit() async {
    if(!validate()) return;

    state = state.copyWith(isSubmitting: true);

    try {
      await Future.delayed(const Duration(seconds: 2));

    } catch (e) {
      // later when API ready
    } finally {
      reset();
    }
  }
}

final productFormController = NotifierProvider<ProductFormNotifier, ProductForm>(() {
  return ProductFormNotifier();
});