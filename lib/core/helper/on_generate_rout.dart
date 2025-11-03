import 'package:dash_board/core/services/get_it_service.dart';
import 'package:dash_board/feature/add_product/data/add_product_repo_impl.dart';
import 'package:dash_board/feature/add_product/domain/add_product_repo.dart';
import 'package:dash_board/feature/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:dash_board/feature/add_product/presentation/view/add_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnGenerateRout {
  static const String addProduct = 'addProduct';

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case OnGenerateRout.addProduct:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AddProductCubit>(
            create: (context) => AddProductCubit(getIt<AddProductRepo>()),
            child: AddProduct(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}
