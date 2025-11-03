
import 'package:dash_board/feature/add_product/data/add_product_repo_impl.dart';
import 'package:dash_board/feature/add_product/domain/add_product_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {

  getIt.registerSingleton<AddProductRepo>(AddProductRepoImpl());

}