import 'dart:io';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DataBaseServices {
  Future<String> uploadImageSupabaseStorage(
      {required String filePath, required File file});
  Future<List<String>> getAllImagesSupabaseStorage({required String filePath});
  Future insertData(
      {required String productName,
      required String description,
      required String code,
      String? urlImage,
      required int price});
}
