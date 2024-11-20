import 'package:dartz/dartz.dart';

import '../enitity/CategoryOrBrandResponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/home_tab_repo.dart';

class GetAllCategoriesUseCase {
  HomeTabRepository homeTapRepository;

  GetAllCategoriesUseCase({required this.homeTapRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeTapRepository.getCategory();
  }
}
