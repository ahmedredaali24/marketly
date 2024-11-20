import 'package:bloc/bloc.dart';

import '../../../../../../domin/enitity/CategoryOrBrandResponseEntity.dart';
import '../../../../../../domin/use_cases/get_all_brandes_use_case.dart';
import '../../../../../../domin/use_cases/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase categoriesUseCase;
  GetAllBrandesUseCase brandesUseCase;

  HomeTabViewModel(
      {required this.categoriesUseCase, required this.brandesUseCase})
      : super(HomeTabInitialState());

  List<CategoryOrBrandEntity> categoryList = [];
  List<CategoryOrBrandEntity> brandesList = [];

  Future<void> getAllCategories() async {
    emit(CategoryOrBrandLoadingState(loadingMessage: "Loading..."));
    var either = await categoriesUseCase.invoke();
    either.fold((l) => emit(CategoryOrBrandErrorState(errorMessage: l)), (r) {
      categoryList = r.data ?? [];
      emit(CategoryOrBrandSuccessState(categoryResponseEntity: r));
    });
  }

  Future<void> getAllBrandes() async {
    emit(CategoryOrBrandLoadingState(loadingMessage: "Loading..."));
    var either = await brandesUseCase.invoke();
    either.fold((l) => emit(CategoryOrBrandErrorState(errorMessage: l)), (r) {
      brandesList = r.data ?? [];
      emit(CategoryOrBrandSuccessState(categoryResponseEntity: r));
    });
  }
}
