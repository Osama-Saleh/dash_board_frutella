import 'dart:io';

import 'package:dash_board/core/helper/show_error.dart';
import 'package:dash_board/core/utils/app_colors.dart';
import 'package:dash_board/feature/add_product/domain/entities/add_product_input_entities.dart';
import 'package:dash_board/feature/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:dash_board/feature/add_product/presentation/widgets/custom_text_form_field.dart';
import 'package:dash_board/feature/add_product/presentation/widgets/is_feature_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProduct extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a New Product',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                CustomTextFormFiled(
                  hintText: 'Product Name',
                  controller: nameController,
                ),
                CustomTextFormFiled(
                    hintText: 'Product Price', controller: priceController),
                CustomTextFormFiled(
                  hintText: 'Product Code',
                  controller: codeController,
                ),
                CustomTextFormFiled(
                  hintText: 'Product Description',
                  keyboardType: TextInputType.multiline,
                  controller: descriptionController,
                ),
                IsFeatureProducState(
                  onChanged: (value) {
                    context.read<AddProductCubit>().changeFeatureProduct(value);
                  },
                ),
                BlocConsumer<AddProductCubit, AddProductState>(
                  listener: (context, state) {
                    print('state.image ${state.image}');
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: () async {
                        await context.read<AddProductCubit>().addImagePicker();
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: state.image == null
                              ? Icon(
                                  Icons.image_outlined,
                                  size: 180,
                                )
                              : Image.file(
                                  File(state.image!.path),
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    );
                  },
                ),
                BlocConsumer<AddProductCubit, AddProductState>(
                  builder: (context, state) {
                    return Align(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (state.image != null) {
                                  AddProductInputEntities inputs = AddProductInputEntities(productName: nameController.text, 
                                  description: descriptionController.text, 
                                  code: codeController.text, 
                                  image: state.image!, 
                                  price: int.parse(priceController.text));
                                } else {
                                  showError(context);
                                  }
                              }
                            },
                            child: Text(
                              'Add Product',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    );
                  },
                  listener: (context, state) {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
