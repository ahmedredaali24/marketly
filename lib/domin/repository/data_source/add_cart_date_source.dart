import 'package:dartz/dartz.dart';

import '../../enitity/AddCartResponseEntity.dart';
import '../../enitity/ProductResponseEntity.dart';
import '../../enitity/failures.dart';

abstract class AddCartDataSource {
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);
}
