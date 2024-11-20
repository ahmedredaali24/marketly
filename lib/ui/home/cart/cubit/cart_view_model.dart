
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domin/enitity/GetCartResponseEntity.dart';
import '../../../../domin/use_cases/cart_use_case.dart';
import '../../../../domin/use_cases/delete_item_cart_use_case.dart';
import '../../../../domin/use_cases/update_cart_use_case.dart';
import 'cart_states.dart';

class CartViewModel extends Cubit<CartStates> {
  GetCartUseCase cartUseCase;
  DeleteItemGetCartUseCase deleteItemGetCartUseCase;
  UpdateGetCartUseCase updateGetCartUseCase;

  CartViewModel(
      {required this.cartUseCase,
      required this.deleteItemGetCartUseCase,
      required this.updateGetCartUseCase})
      : super(CartStatesInitialState());

  List<GetProductsCartEntity>? cartList = [];

  static CartViewModel get(context) => BlocProvider.of(context);

  getCart() async {
    emit(CartStatesLoadingState(loadingMessage: 'Loading....'));
    var either = await cartUseCase.invoke();
    either.fold((l) => emit(CartStatesErrorState(errorMessage: l)), (r) {
      cartList = r.data!.products ?? [];
      emit(CartStatesSuccessState(getCartResponseEntity: r));
    });
  }

  ///deleteInCart
  deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState(loadingMessage: 'Loading....'));
    var either = await deleteItemGetCartUseCase.invoke(productId);
    either.fold((l) => emit(DeleteItemInCartStatesErrorState(errorMessage: l)),
        (r) {
      // cartList=r.data!.products??[];
      emit(CartStatesSuccessState(getCartResponseEntity: r));
    });
  }

  ///UpdateInCart
  updateItemInCart(String productId, int count) async {
    emit(UpdateCountInCartLoadingState(loadingMessage: 'Loading...'));
    var either = await updateGetCartUseCase.invoke(productId, count);
    either.fold((l) => emit(UpdateCountInCartErrorState(errors: l)),
        (response) {
      // productList = response.data!.products! ;
      print('deleted item successfully');
      emit(CartStatesSuccessState(getCartResponseEntity: response));
    });
  }
}
