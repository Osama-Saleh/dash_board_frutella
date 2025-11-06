import 'dart:io';
import 'package:dash_board/core/services/data_base.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseStorage implements DataBaseServices {
  final supabase = Supabase.instance.client;

  @override
  Future<String> uploadImageSupabaseStorage(
      {required String filePath, required File file}) async {
    // supabase.storage.from('images').list(path: "products/${filePath}");
    
     await supabase.storage
        .from('images')
        .upload('products/${filePath}', file);
    return await supabase.storage
        .from('images/products/').getPublicUrl(filePath);
  }

  @override
  Future<List<String>> getAllImagesSupabaseStorage(
      {required String filePath}) async {
    List<FileObject> data = await supabase.storage
        .from('images')
        .list(path: "products/");
        final List<String> urls = data.map((file) {
  return supabase.storage.from('image').getPublicUrl(file.name);
}).toList();
    return urls;
  }
  
  @override
  Future insertData({required String productName, required String description, required String code, String? urlImage,required int price}) async {
    await supabase
    .from('products')
    .insert({'name': 'The Shire', 'country_id': 554});


  }

}
