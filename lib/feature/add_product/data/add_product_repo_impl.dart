import 'package:dart_either/dart_either.dart';
import 'package:dash_board/feature/add_product/domain/add_product_repo.dart';
import 'package:image_picker/image_picker.dart';

class AddProductRepoImpl implements AddProductRepo {
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
}
