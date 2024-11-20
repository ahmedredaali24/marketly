import 'package:dartz/dartz.dart';

import '../../../domin/enitity/CategoryOrBrandResponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/home_tab_remote_data_source.dart';
import '../../../domin/repository/repository/home_tab_repo.dart';


class HomeTabRepoImpl implements HomeTabRepository {
  HomeTabRemoteDateSource homeTabRemoteDateSource;

  HomeTabRepoImpl({required this.homeTabRemoteDateSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategory() {
    return homeTabRemoteDateSource.getCategory();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrandes() {
    return homeTabRemoteDateSource.getBrandes();
  }
}
