part of 'add_product_cubit.dart';

 class AddProductState {
   XFile? image;
   bool? isFeatureProduct;

  AddProductState({this.image,this.isFeatureProduct = false});

  AddProductState copyWith({XFile? image,bool? isFeatureProduct}) {
    return AddProductState(
      image: image ?? this.image,
      isFeatureProduct: isFeatureProduct ?? this.isFeatureProduct
    );
  }
 }

