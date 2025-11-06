import 'dart:io';

import 'package:dash_board/core/helper/show_error.dart';
import 'package:dash_board/core/services/data_base.dart';
import 'package:dash_board/feature/add_product/domain/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductRepoImple implements ProductRepo {
  final DataBaseServices supaBaseStoreServices;

  ProductRepoImple({required this.supaBaseStoreServices});

  @override
  Future<XFile?> addImagePicker() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return image;
      } else {
        throw Exception('No image selected');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<String> uploadImage(
      {required BuildContext context,
      required String filePath,
      required File file}) async {
    try {
      String imageUrl = await supaBaseStoreServices.uploadImageSupabaseStorage(
          filePath: filePath, file: file);
      // showError(context, "image upload success");
      return imageUrl;
    } catch (e) {
      print(e);
      if (e is StorageException) {
        showError(context, "faild uplaod iamge\n${e.message}");
      }else{

      showError(context, "faild uplaod iamge\n ${e.toString()}");
      }
      return '';
    }
  }

  @override
  Future<List<String>> getAllImages({
    required BuildContext context,
    required String filePath,
  }) async {
    try {
      List<String> productImages = await supaBaseStoreServices
          .getAllImagesSupabaseStorage(filePath: filePath);
      return productImages;
    } catch (e) {
      print(e);
      if (e is StorageException) {
        showError(context, "${e.message}");
      }else{

      showError(context, "faild get iamge\n ${e.toString()}");
      }
      return [];
    }
  }

  @override
  Future insertData(
      {required String productName,
      required String description,
      required String code,
      String? urlImage,
      required int price,
      required BuildContext context,
      }) async {
    try {
    var r =  await supaBaseStoreServices.insertData(
        productName: productName,
        description: description,
        code: code,
        price: price,
        urlImage: urlImage,
      );
      print(r);
    } catch (e) {
      if(e is PostgrestException){
        showError(context, e.message);
      }else{

        showError(context, e.toString());
      }
      
    }
  }
}
