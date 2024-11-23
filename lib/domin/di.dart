import 'package:marketly/domin/repository/data_source/add_cart_date_source.dart';
import 'package:marketly/domin/repository/data_source/add_fav_remote_data_source.dart';
import 'package:marketly/domin/repository/data_source/auth_remote_date_source.dart';
import 'package:marketly/domin/repository/data_source/cart_remote_data_sourse.dart';
import 'package:marketly/domin/repository/data_source/get_fav_remote_data_sourse.dart';
import 'package:marketly/domin/repository/data_source/home_tab_remote_data_source.dart';
import 'package:marketly/domin/repository/data_source/product_tab_remote_date_source.dart';
import 'package:marketly/domin/repository/repository/add_cart_repo.dart';
import 'package:marketly/domin/repository/repository/auth_repository.dart';
import 'package:marketly/domin/repository/repository/cart_repo.dart';
import 'package:marketly/domin/repository/repository/fav_repo.dart';
import 'package:marketly/domin/repository/repository/get_fav_repo.dart';
import 'package:marketly/domin/repository/repository/home_tab_repo.dart';
import 'package:marketly/domin/repository/repository/product_tab_repo.dart';
import 'package:marketly/domin/use_cases/add_cart_use_case.dart';
import 'package:marketly/domin/use_cases/cart_use_case.dart';
import 'package:marketly/domin/use_cases/delete_item_cart_use_case.dart';
import 'package:marketly/domin/use_cases/delete_item_fav_use_case.dart';
import 'package:marketly/domin/use_cases/fav_use_case.dart';
import 'package:marketly/domin/use_cases/get_all_brandes_use_case.dart';
import 'package:marketly/domin/use_cases/get_all_categories_use_case.dart';
import 'package:marketly/domin/use_cases/get_all_product_use_case.dart';
import 'package:marketly/domin/use_cases/get_favorite_use_case.dart';
import 'package:marketly/domin/use_cases/google_register_use_case.dart';
import 'package:marketly/domin/use_cases/login_use_case.dart';
import 'package:marketly/domin/use_cases/register_use_case.dart';
import 'package:marketly/domin/use_cases/update_cart_use_case.dart';

import '../data/api/add_cart_api_manger.dart';
import '../data/api/auth_api_manger.dart';
import '../data/api/brandes_api_manger.dart';
import '../data/api/categories_api_manger.dart';
import '../data/api/fav_api_manger.dart';
import '../data/api/get_cart_api_manger.dart';
import '../data/api/products_api_manger.dart';
import '../data/repository/date_source/add_cart_data_source_impl.dart';
import '../data/repository/date_source/auth_remote_date_source_impl.dart';
import '../data/repository/date_source/fav_data_source_impl.dart';
import '../data/repository/date_source/get_cart_remot_data_source_impl.dart';
import '../data/repository/date_source/get_fav_remote_date_source.dart';
import '../data/repository/date_source/home_tab_remote_date_source_impl.dart';
import '../data/repository/date_source/product_tab_remote_date_source_impl.dart';
import '../data/repository/repository/add_cart_repo_impl.dart';
import '../data/repository/repository/auth_repository_impl.dart';
import '../data/repository/repository/fav_repo_impl.dart';
import '../data/repository/repository/get_cart_repo_impl.dart';
import '../data/repository/repository/get_fav_repo_impl.dart';
import '../data/repository/repository/home_tab_repo_impl.dart';
import '../data/repository/repository/product_tab_repo_impl.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepositoryContract());
}

GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(homeTapRepository: injectHomeRepository());
}

GetAllBrandesUseCase injectGetAllBrandesUseCase() {
  return GetAllBrandesUseCase(homeTapRepository: injectHomeRepository());
}

GetAllProductUseCase injectGetAllProductUseCase() {
  return GetAllProductUseCase(productTabRepo: injectProductTabRepo());
}

ProductTabRepo injectProductTabRepo() {
  return ProductTabRepoImpl(
      productTabRemoteDateSource: injectProductTabRemoteDateSource());
}

ProductTabRemoteDateSource injectProductTabRemoteDateSource() {
  return ProductTabRemoteDateSourceImpl(
      productsApiManger: ProductsApiManger.getInstance());
}

DeleteFavoriteCartUseCase injectDeleteFavoriteCartUseCase() {
  return DeleteFavoriteCartUseCase(getFavoriteRepo: injectGetFavoriteRepo());
}

GetFavoriteUseCase injectGetFavoriteUseCase() {
  return GetFavoriteUseCase(getFavoriteRepo: injectGetFavoriteRepo());
}

GetFavoriteRepo injectGetFavoriteRepo() {
  return GetFavoriteRepoImpl(
      getFavoriteRemoteDataSource: injectGetFavoriteRemoteDataSource());
}

GetFavoriteRemoteDataSource injectGetFavoriteRemoteDataSource() {
  return GetFavoriteRemoteDataSourceImpl(
      favoriteApiManger: FavoriteApiManger.getInstance());
}

FavoriteUseCase injectFavoriteUseCase() {
  return FavoriteUseCase(favoriteRepo: injectFavoriteRepo());
}

FavoriteRepo injectFavoriteRepo() {
  return FavoriteRepoImpl(favRemoteDataSource: injectFavRemoteDataSource());
}

FavRemoteDataSource injectFavRemoteDataSource() {
  return FavoriteDataSourceImpl(
      favoriteApiManger: FavoriteApiManger.getInstance());
}

AddCartUseCase injectAddCartUseCase() {
  return AddCartUseCase(addCartRepo: injectAddCartRepo());
}

AddCartRepo injectAddCartRepo() {
  return AddCartRepoImpl(addCartDataSource: injectAddCartDataSource());
}

AddCartDataSource injectAddCartDataSource() {
  return AddCartDataSourceImpl(
      addCartApiManger: AddCartApiManger.getInstance());
}

HomeTabRepository injectHomeRepository() {
  return HomeTabRepoImpl(homeTabRemoteDateSource: injectHomeRemoteDateSource());
}

HomeTabRemoteDateSource injectHomeRemoteDateSource() {
  return HomeTabRemoteDateSourceImpl(
      categoriesApiManger: CategoriesApiManger.getInstance(),
      brandesApiManger: BrandesApiManger.getInstance());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(remoteDateSource: injectAuthRemoteDateSource());
}

AuthRemoteDateSource injectAuthRemoteDateSource() {
  return AuthRemoteDateSourceImpl(apiManger: ApiManger.getInstance());
}

UpdateGetCartUseCase injectUpdateGetCartUseCase() {
  return UpdateGetCartUseCase(cartRepo: injectCartRepo());
}

DeleteItemGetCartUseCase injectDeleteItemGetCartUseCase() {
  return DeleteItemGetCartUseCase(cartRepo: injectCartRepo());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(cartRepo: injectCartRepo());
}

CartRepo injectCartRepo() {
  return GetCartRepoImpl(cartRemoteDataSource: injectCartRemoteDataSource());
}

CartRemoteDataSource injectCartRemoteDataSource() {
  return GetCartRemoteDataSourceImpl(
      cartApiManger: GetCartApiManger.getInstance());
}

GoogleRegisterUseCase injectGoogleRegisterUseCase() {
  return GoogleRegisterUseCase(authRepository: injectAuthRepositoryContract());
}
