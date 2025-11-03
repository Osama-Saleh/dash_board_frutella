import 'dart:io';

import 'package:dart_either/dart_either.dart';
import 'package:dash_board/feature/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:dash_board/feature/add_product/presentation/widgets/custom_text_form_field.dart';
import 'package:dash_board/feature/add_product/presentation/widgets/is_feature_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    print('object1');
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
              CustomTextFormFiled(hintText: 'Product Name'),
              CustomTextFormFiled(hintText: 'Product Price'),
              CustomTextFormFiled(hintText: 'Product Code'),
              CustomTextFormFiled(
                  hintText: 'Product Description',
                  keyboardType: TextInputType.multiline),
              IsFeatureProducState(
                onChanged: (value) {},
              ),
              BlocConsumer<AddProductCubit, AddProductState>(
                listener: (context, state) {
                  
                },
                builder: (context, state) {
                  print('object2');
                  return InkWell(
                    onTap: () async {
                      state.image = await context
                          .read<AddProductCubit>()
                          .addImagePicker();
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(4),
                      ),
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
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
