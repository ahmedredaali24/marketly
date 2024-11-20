import 'package:dartz/dartz.dart';

import '../../enitity/CategoryOrBrandResponseEntity.dart';
import '../../enitity/failures.dart';

abstract class HomeTabRemoteDateSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategory();
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrandes();

}
