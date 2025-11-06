part of 'add_product_cubit.dart';

 class AddProductState {
   XFile? image;
   bool? isFeatureProduct;
   String? imageUrl;

  AddProductState({this.image,this.isFeatureProduct = false,this.imageUrl});

  AddProductState copyWith({XFile? image,bool? isFeatureProduct,String? imageUrl}) {
    return AddProductState(
      image: image ?? this.image,
      isFeatureProduct: isFeatureProduct ?? this.isFeatureProduct,
      imageUrl: imageUrl ?? this.imageUrl
    );
  }
 }

