// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

class AddProductInputEntities {
  String productName;
  String description;
  String code;
  XFile image;
  String? urlImage;
  int price;
  AddProductInputEntities({
    required this.productName,
    required this.description,
    required this.code,
    required this.image,
    this.urlImage,
    required this.price,
  });
  
}
