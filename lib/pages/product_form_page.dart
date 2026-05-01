import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:selfcare_app/models/view_product_model.dart';
import 'package:selfcare_app/notifiers/product_form_notifier.dart';
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
  late var currentCategory;
  // Text Controllers for Text Fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    currentCategory = widget.product == null ? 0 : widget.product!.product.categoryId;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _sizeController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _nameController.clear();
    _typeController.clear();
    _sizeController.clear();
    _unitController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Form Data
    final formFieldTitle = theme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.bold
    );
    // Product Data
    final categories = ref.watch(categoryProvider).skip(1);
    final productTypes = ref.watch(productTypeProvider(currentCategory));
    final unitSizes = ref.watch(productSizeUnitProvider);
    // Screen Size Data
    final screenWidth = MediaQuery.of(context).size.width;
    // Form State
    final formState = ref.watch(productFormController);
    final formAction = ref.read(productFormController.notifier);
    // Error Style
    const invisibleErrorStyle = TextStyle(color: Colors.transparent, fontSize: 0);
    // Form Clear
    ref.listen(productFormController, (previous, next) {
      if(next.isInitial && previous != null && !previous.isInitial) {
        _clearForm();
      }
    });
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
                // key: _formKey,
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
                      style: theme.textTheme.bodySmall,
                      decoration: InputDecoration(
                        hint: Text(
                          'Product Name',
                          style: theme.inputDecorationTheme.hintStyle,
                        ),
                        errorText: formState.nameError,
                      ),
                      controller: _nameController,
                      onChanged: (value) => formAction.updateName(value),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                textStyle: theme.textTheme.bodySmall,
                                hintText: 'Product Type',
                                //helperText: '',
                                errorText: formState.typeError,
                                inputDecorationTheme: InputDecorationTheme(
                                  constraints: BoxConstraints(
                                    minHeight: 48,
                                    maxHeight: formState.typeError == null ? 48 : 68,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                controller: _typeController,
                                onSelected: (value) { 
                                  if(value != null) formAction.selectType(value);
                                },
                                dropdownMenuEntries: [
                                  for(var type in productTypes) 
                                    DropdownMenuEntry(
                                      label: type.name,
                                      value: type.id
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
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: theme.textTheme.bodySmall,
                                      onChanged: (value) => formAction.updateSize(value),
                                      controller: _sizeController,
                                      decoration: InputDecoration(
                                        hint: Text(
                                          'Size',
                                          style: theme.inputDecorationTheme.hintStyle,
                                        ),
                                        errorText: formState.sizeError,
                                        errorStyle: invisibleErrorStyle
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DropdownMenu(
                                    width: 100,
                                    textStyle: theme.textTheme.bodySmall,
                                    hintText: 'Unit',
                                    errorText: formState.sizeUnitError,
                                    inputDecorationTheme: InputDecorationTheme(
                                      constraints: BoxConstraints(
                                        minHeight: 48,
                                        maxHeight: 48,
                                      ),
                                      errorStyle: invisibleErrorStyle,
                                    ),
                                    controller: _unitController,
                                    onSelected: (value) {
                                      if(value != null) formAction.selectSizeUnit(value);
                                    },
                                    dropdownMenuEntries: [
                                      for(var unit in unitSizes)
                                      DropdownMenuEntry(
                                        label: unit.name, 
                                        value: unit.id
                                      )
                                    ]
                                  )
                                ],
                              ),
                              if(formState.sizeError != null || formState.sizeUnitError != null)
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    formState.sizeError ?? formState.sizeUnitError ?? '',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.error
                                    ),
                                  ),
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
                              formAction.selectCategory(cat.id);
                            },
                            child: CategoryCard(
                              category: cat,
                              length: categories.length,
                              nonColor : formState.categoryId == cat.id ? null : true
                            ),
                          )
                        );
                      }).toList(),
                    ),
                    if(formState.categoryError != null) 
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        formState.categoryError ?? '',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.error
                        ),
                      ),
                    )
                  ],
                )
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  try {
                    if(!formState.isSubmitting) {
                      final success = await formAction.submit();
                      if(success && mounted) context.pop();
                    }
                  } catch (er) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                child: formState.isSubmitting
                ? CircularProgressIndicator()
                :Text(
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