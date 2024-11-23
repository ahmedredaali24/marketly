import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketly/ui/home/home_screen/taps/prod_tap/cubit/product_list_tab_states.dart';

import '../../../../../../domin/enitity/ProductResponseEntity.dart';
import '../../../../../../domin/use_cases/add_cart_use_case.dart';
import '../../../../../../domin/use_cases/fav_use_case.dart';
import '../../../../../../domin/use_cases/get_all_product_use_case.dart';

class ProductListTabViewModel extends Cubit<ProductListTabStates> {
  GetAllProductUseCase getAllProductUseCase;
  AddCartUseCase addCartUseCase;
  FavoriteUseCase favoriteUseCase;

  ProductListTabViewModel(
      {required this.getAllProductUseCase,
      required this.addCartUseCase,
      required this.favoriteUseCase})
      : super(ProductListTabInitialState());

  List<ProductEntity> productList = [];
  int numOfCartItem = 0;

  static ProductListTabViewModel get(context) => BlocProvider.of(context);

  Future<void> getProducts() async {
    emit(ProductListTabLoadingState(loadingMessage: "Loading..."));
    var either = await getAllProductUseCase.invoke();
    either.fold((l) => emit(ProductListTabErrorState(errorMessage: l)), (r) {
      productList = r.data ?? [];
      emit(ProductListTabSuccessState(productResponseEntity: r));
    });
  }

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: "Loading..."));
    var either = await addCartUseCase.invoke(productId);
    either.fold((l) => emit(AddToCartErrorState(errorMessage: l)), (r) {
      numOfCartItem = r.numOfCartItems!.toInt();
      print("numOfCartItem:$numOfCartItem");
      emit(AddToCartSuccessState(addCartResponseEntity: r));
    });
  }

  Future<void> addToFavorite(String productId) async {
    emit(AddToFavoriteLoadingState(loadingMessage: "Loading..."));
    var either = await favoriteUseCase.invoke(productId);
    either.fold((l) => emit(AddToFavoriteErrorState(errorMessage: l)), (r) {
      // numOfCartItem = r.numOfCartItems!.toInt();
      print("numOfCartItem:$numOfCartItem");
      emit(AddToFavoriteSuccessState(favoriteResponseEntity: r));
    });
  }
}
