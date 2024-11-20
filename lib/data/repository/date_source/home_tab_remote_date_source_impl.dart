import 'package:dartz/dartz.dart';


import '../../../domin/enitity/CategoryOrBrandResponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/home_tab_remote_data_source.dart';
import '../../api/brandes_api_manger.dart';
import '../../api/categories_api_manger.dart';

class HomeTabRemoteDateSourceImpl implements HomeTabRemoteDateSource {
  CategoriesApiManger categoriesApiManger;
  BrandesApiManger brandesApiManger;

  HomeTabRemoteDateSourceImpl(
      {required this.categoriesApiManger, required this.brandesApiManger});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategory() async {
    var either = await categoriesApiManger.getCategories();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrandes() async {
    var either = await brandesApiManger.getBrandes();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }
}
