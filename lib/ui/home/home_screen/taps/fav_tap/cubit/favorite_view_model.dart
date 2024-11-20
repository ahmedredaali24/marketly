
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domin/enitity/GetFavoriteresponseEntity.dart';
import '../../../../../../domin/use_cases/delete_item_fav_use_case.dart';
import '../../../../../../domin/use_cases/fav_use_case.dart';
import '../../../../../../domin/use_cases/get_favorite_use_case.dart';
import 'favorite_states.dart';

class FavoriteViewModel extends Cubit<FavoriteStates> {
  GetFavoriteUseCase getFavoriteUseCase;
  FavoriteUseCase favoriteUseCase;

  FavoriteViewModel({required this.getFavoriteUseCase,required this.favoriteUseCase})
      : super(FavoriteInitialState());

  List<GetFavDataEntity> favoriteList = [];
  int numOfCartItem = 0;

  static FavoriteViewModel get(context)=>BlocProvider.of(context);
  getFavorite() async {
    emit(FavoriteLoadingState(loadingMessage: "Loading"));
    var either = await getFavoriteUseCase.invoke();
    either.fold((l) => emit(FavoriteErrorState(errorMessage: l)), (r) {
      favoriteList=r.data??[];
      emit(FavoriteSuccessState(favoriteResponseEntity: r));
    });
  }
  deleteFavorite(String productId) async {
    emit(DeleteFavoriteLoadingState(loadingMessage: "Loading"));
    var either = await favoriteUseCase.invoke(productId);
    either.fold((l) => emit(DeleteFavoriteErrorState(errorMessage: l)), (r) {
      emit(DeleteFavoriteSuccessState(favoriteResponseEntity: r));
    });
  }

}
