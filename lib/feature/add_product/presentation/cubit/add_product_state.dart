part of 'add_product_cubit.dart';

 class AddProductState {
   XFile? image;

  AddProductState({this.image});

  AddProductState copyWith({XFile? image}) {
    return AddProductState(
      image: image ?? this.image,
    );
  }
 }

