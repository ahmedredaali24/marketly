

import '../../../../../../domin/enitity/AddCartResponseEntity.dart';
import '../../../../../../domin/enitity/FavoriteresponseEntity.dart';
import '../../../../../../domin/enitity/ProductResponseEntity.dart';
import '../../../../../../domin/enitity/failures.dart';

abstract class ProductListTabStates {}

class ProductListTabInitialState extends ProductListTabStates {}

class ProductListTabErrorState extends ProductListTabStates {
  Failures? errorMessage;

  ProductListTabErrorState({required this.errorMessage});
}

class ProductListTabSuccessState extends ProductListTabStates {
  ProductResponseEntity productResponseEntity;

  ProductListTabSuccessState({required this.productResponseEntity});
}

class ProductListTabLoadingState extends ProductListTabStates {
  String? loadingMessage;

  ProductListTabLoadingState({required this.loadingMessage});
}

/// addToCartStates

class AddToCartErrorState extends ProductListTabStates {
  Failures? errorMessage;

  AddToCartErrorState({required this.errorMessage});
}

class AddToCartSuccessState extends ProductListTabStates {
  AddCartResponseEntity addCartResponseEntity;

  AddToCartSuccessState({required this.addCartResponseEntity});
}

class AddToCartLoadingState extends ProductListTabStates {
  String? loadingMessage;

  AddToCartLoadingState({required this.loadingMessage});
}
/// addToFavoriteStates

class AddToFavoriteErrorState extends ProductListTabStates {
  Failures? errorMessage;

  AddToFavoriteErrorState({required this.errorMessage});
}

class AddToFavoriteSuccessState extends ProductListTabStates {
  FavoriteResponseEntity favoriteResponseEntity;

  AddToFavoriteSuccessState({required this.favoriteResponseEntity});
}

class AddToFavoriteLoadingState extends ProductListTabStates {
  String? loadingMessage;

  AddToFavoriteLoadingState({required this.loadingMessage});
}
