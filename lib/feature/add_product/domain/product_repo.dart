import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProductRepo {
  Future<XFile?> addImagePicker();
  Future<String> uploadImage(
      {required BuildContext context,
      required String filePath,
      required File file});
  Future<List<String>> getAllImages({
    required BuildContext context,
    required String filePath,
  });
  Future insertData({
    required String productName,
    required String description,
    required String code,
    String? urlImage,
    required int price,
    required BuildContext context,
  });
}
