class ProductForm {
  final String name;
  final int? categoryId;
  final int? typeId;
  final String size;
  final int? sizeUnitId;

  final String? nameError;
  final String? categoryError;
  final String? typeError;
  final String? sizeError;
  final String? sizeUnitError;

  final bool isSubmitting;

  const ProductForm({
    this.name = '',
    this.categoryId,
    this.typeId,
    this.size = '',
    this.sizeUnitId,
    this.nameError,
    this.categoryError,
    this.typeError,
    this.sizeError,
    this.sizeUnitError,
    this.isSubmitting = false
  });

  static const initial = ProductForm();

  bool get isInitial => this == ProductForm.initial;

  ProductForm copyWith({
    String? name,
    int? categoryId,
    int? typeId,
    String? size,
    int? sizeUnitId,

    String? nameError,
    String? categoryError,
    String? typeError,
    String? sizeError,
    String? sizeUnitError,

    bool? isSubmitting
  }) {
    return ProductForm(
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      typeId: typeId ?? this.typeId,
      size: size ?? this.size,
      sizeUnitId: sizeUnitId ?? this.sizeUnitId,

      nameError: nameError,
      categoryError: categoryError,
      typeError: typeError,
      sizeError: sizeError,
      sizeUnitError: sizeUnitError,

      isSubmitting: isSubmitting ?? this.isSubmitting
    );
  }
}