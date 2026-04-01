import 'package:selfcare_app/models/product_model.dart';

class ViewProduct {
  final Product product;
  final String category;
  final String type;
  final String sizeUnit;

  ViewProduct({
    required this.product,
    required this.category,
    required this.type,
    required this.sizeUnit
  });
}