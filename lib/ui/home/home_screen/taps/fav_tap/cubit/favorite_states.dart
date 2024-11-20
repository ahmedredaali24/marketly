

import '../../../../../../domin/enitity/FavoriteresponseEntity.dart';
import '../../../../../../domin/enitity/GetFavoriteresponseEntity.dart';
import '../../../../../../domin/enitity/failures.dart';

abstract class FavoriteStates {}

class FavoriteInitialState extends FavoriteStates {}

class FavoriteLoadingState extends FavoriteStates {
  String? loadingMessage;

  FavoriteLoadingState({required this.loadingMessage});
}

class FavoriteErrorState extends FavoriteStates {
  Failures? errorMessage;

  FavoriteErrorState({required this.errorMessage});
}

class FavoriteSuccessState extends FavoriteStates {
  GetFavoriteResponseEntity favoriteResponseEntity;

  FavoriteSuccessState({required this.favoriteResponseEntity});
}

///deleteFavorite

class DeleteFavoriteLoadingState extends FavoriteStates {
  String? loadingMessage;

  DeleteFavoriteLoadingState({required this.loadingMessage});
}

class DeleteFavoriteErrorState extends FavoriteStates {
  Failures? errorMessage;

  DeleteFavoriteErrorState({required this.errorMessage});
}

class DeleteFavoriteSuccessState extends FavoriteStates {
  FavoriteResponseEntity favoriteResponseEntity;

  DeleteFavoriteSuccessState({required this.favoriteResponseEntity});
}
