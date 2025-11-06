import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dash_board/core/helper/show_error.dart';
import 'package:dash_board/feature/add_product/domain/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  ProductRepo productRepoImpl;
  AddProductCubit(this.productRepoImpl) : super(AddProductState());

  Future addImagePicker() async {
    XFile? file = await productRepoImpl.addImagePicker();
    emit(state.copyWith(image: file));
    // return  productRepoImpl.addImagePicker();
  }

  void changeFeatureProduct(bool value) {
    emit(state.copyWith(isFeatureProduct: value));
  }

  Future<String> uplaodImage(
      {required BuildContext context,
      required String filePath,
      required File file}) async {
    String fileName = filePath.split("/").last;

    String imageUrl = await productRepoImpl.uploadImage(
        context: context, filePath: fileName, file: file);
    emit(state.copyWith(imageUrl: imageUrl));
    return imageUrl;
  }


  Future getAllProductImages({
    required BuildContext context,
    required String filePath,
  }) async {
    String fileName = filePath.split("/").last;

    await productRepoImpl.getAllImages(context: context, filePath: fileName);
  }

  Future insertData({
    required String productName,
    required String description,
    required String code,
    String? urlImage,
    required int price,
    required BuildContext context,
  }) async {
    await productRepoImpl.insertData(
        context: context,
        productName: productName,
        description: description,
        code: code,
        price: price,
        urlImage: state.imageUrl);
  }
}
