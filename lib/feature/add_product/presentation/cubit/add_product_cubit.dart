import 'package:bloc/bloc.dart';
import 'package:dash_board/feature/add_product/domain/add_product_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../data/add_product_repo_impl.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductRepo addProductRepoImpl;
  AddProductCubit(this.addProductRepoImpl) : super(AddProductState());

  Future addImagePicker()async{
   XFile? file = await addProductRepoImpl.addImagePicker();
    emit(state.copyWith(image: file));
    // return  addProductRepoImpl.addImagePicker();
  }
}
