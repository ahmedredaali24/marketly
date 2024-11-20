
import '../../../../domin/enitity/GetCartResponseEntity.dart';
import '../../../../domin/enitity/failures.dart';

abstract class CartStates {}

class CartStatesInitialState extends CartStates {}

class CartStatesErrorState extends CartStates {
  Failures? errorMessage;

  CartStatesErrorState({required this.errorMessage});
}

class CartStatesSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  CartStatesSuccessState({required this.getCartResponseEntity});
}

class CartStatesLoadingState extends CartStates {
  String? loadingMessage;

  CartStatesLoadingState({required this.loadingMessage});
}

///deleteItemsStates

class DeleteItemInCartStatesErrorState extends CartStates {
  Failures? errorMessage;

  DeleteItemInCartStatesErrorState({required this.errorMessage});
}

class DeleteItemInCartSuccessState extends CartStates {
  GetCartResponseEntity getCartResponseEntity;

  DeleteItemInCartSuccessState({required this.getCartResponseEntity});
}

class DeleteItemInCartLoadingState extends CartStates {
  String? loadingMessage;

  DeleteItemInCartLoadingState({required this.loadingMessage});
}

///UpdateItemsStates
class UpdateCountInCartLoadingState extends CartStates{
  String? loadingMessage ;
  UpdateCountInCartLoadingState({required this.loadingMessage});
}
class UpdateCountInCartErrorState extends CartStates{
  Failures? errors ;
  UpdateCountInCartErrorState({required this.errors});
}
class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity ;
  UpdateCountInCartSuccessState({required this.responseEntity});
}