

import '../../../../../../domin/enitity/CategoryOrBrandResponseEntity.dart';
import '../../../../../../domin/enitity/failures.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryOrBrandLoadingState extends HomeTabStates {
  String? loadingMessage;

  CategoryOrBrandLoadingState({required this.loadingMessage});
}

class CategoryOrBrandErrorState extends HomeTabStates {
  Failures? errorMessage;

  CategoryOrBrandErrorState({required this.errorMessage});
}

class CategoryOrBrandSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity? categoryResponseEntity;

  CategoryOrBrandSuccessState({required this.categoryResponseEntity});
}
