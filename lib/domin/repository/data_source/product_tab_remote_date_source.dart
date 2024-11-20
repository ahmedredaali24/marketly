import 'package:dartz/dartz.dart';

import '../../enitity/ProductResponseEntity.dart';
import '../../enitity/failures.dart';

abstract class ProductTabRemoteDateSource {
  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
