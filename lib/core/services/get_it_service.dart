
import 'package:dash_board/core/services/data_base.dart';
import 'package:dash_board/core/services/supa_base_storage.dart';
import 'package:dash_board/feature/add_product/data/product_repo_imple.dart';
import 'package:dash_board/feature/add_product/domain/product_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {

  getIt.registerSingleton<DataBaseServices>(SupaBaseStorage());
  getIt.registerSingleton<ProductRepo>(ProductRepoImple(
    supaBaseStoreServices: getIt<DataBaseServices>()
  ));

}