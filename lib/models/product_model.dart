import 'package:flutter/foundation.dart';

class Product {
  final int id;
  final int categoryId;
  final String productName;
  final double productSize;
  final int productSizeUnitId;
  final int productTypeId;

  Product({
    required this.id,
    required this.categoryId,
    required this.productName,
    required this.productSize,
    required this.productSizeUnitId,
    required this.productTypeId
  });
}