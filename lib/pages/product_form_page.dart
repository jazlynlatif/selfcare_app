import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selfcare_app/models/view_product_model.dart';
import 'package:selfcare_app/providers/category_provider.dart';
import 'package:selfcare_app/providers/product_provider.dart';
import 'package:selfcare_app/widgets/category_card.dart';

class ProductForm extends ConsumerStatefulWidget {
  final ViewProduct? product;

  const ProductForm({
    super.key,
    this.product
  });

  @override
  ConsumerState<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<ProductForm> {
    // Text Editing Controller
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productSize = TextEditingController();
  final TextEditingController _productSizeUnit = TextEditingController();
  final TextEditingController _productType = TextEditingController();
  late var currentCategory;

  @override
  void initState() {
    // TODO: implement initState
    currentCategory = widget.product == null ? 0 : widget.product!.product.categoryId;
    super.initState();
  }

  @override
  void dispose() {
    _productName.dispose();
    _productSize.dispose();
    _productSizeUnit.dispose();
    _productType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Form Data
    final _formKey = GlobalKey<FormState>();
    final formFieldTitle = theme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.bold
    );
    // Product Data
    final categories = ref.watch(categoryProvider).skip(1);
    final productTypes = ref.watch(productTypeProvider(currentCategory));
    final unitSizes = ref.watch(productSizeUnitProvider);
    // Screen Size Data
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Form',
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Product Name',
                      style: formFieldTitle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _productName,
                      style: theme.textTheme.bodySmall,
                      decoration: InputDecoration(
                        hint: Text(
                          'Product Name',
                          style: theme.inputDecorationTheme.hintStyle,
                          ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter Product Type',
                                style: formFieldTitle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DropdownMenu(
                                width: (screenWidth-20)/2,
                                controller: _productType,
                                textStyle: theme.textTheme.bodySmall,
                                hintText: 'Product Type',
                                inputDecorationTheme: InputDecorationTheme(
                                  constraints: BoxConstraints.tight(Size.fromHeight(48)),
                                ),
                                dropdownMenuEntries: [
                                  for(var type in productTypes) 
                                    DropdownMenuEntry(
                                      label: type.name,
                                      value: type
                                    )
                                ]
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter Product Size',
                                style: formFieldTitle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _productSize,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: theme.textTheme.bodySmall,
                                      decoration: InputDecoration(
                                        hint: Text(
                                          'Size',
                                          style: theme.inputDecorationTheme.hintStyle,
                                        )
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // SizedBox(
                                  //   width: 65,
                                  //   child: TextFormField(
                                  //     decoration: InputDecoration(
                                  //       hint: Text(
                                  //         'Unit',
                                  //         style: theme.inputDecorationTheme.hintStyle,
                                  //       )
                                  //     ),
                                  //   )
                                  // )
                                  DropdownMenu(
                                    controller: _productSizeUnit,
                                    width: 100,
                                    textStyle: theme.textTheme.bodySmall,
                                    hintText: 'Unit',
                                    inputDecorationTheme: InputDecorationTheme(
                                      constraints: BoxConstraints.tight(Size.fromHeight(48)),
                                    ),
                                    dropdownMenuEntries: [
                                      for(var unit in unitSizes)
                                      DropdownMenuEntry(
                                        label: unit.name, 
                                        value: unit
                                      )
                                    ]
                                  )
                                ],
                              )
                            ],
                          )
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Select category',
                      style: formFieldTitle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: categories.map((cat) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentCategory = cat.id;
                              });
                            },
                            child: CategoryCard(
                              category: cat,
                              length: categories.length,
                              nonColor : currentCategory == cat.id ? null : true
                            ),
                          )
                        );
                      }).toList(),
                    )
                  ],
                )
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                child: Text(
                  'Add Product',
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.bold
                  ),
                )
              )
            ],
          ),
        )
      ),
    );
  }
}