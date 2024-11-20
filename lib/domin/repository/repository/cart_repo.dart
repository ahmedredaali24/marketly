import 'package:dartz/dartz.dart';

import '../../enitity/GetCartResponseEntity.dart';
import '../../enitity/failures.dart';


abstract class CartRepo {
  Future<Either<Failures, GetCartResponseEntity>> getCart();
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId);
  Future<Either<Failures, GetCartResponseEntity>> updateInCart(String productId,int count);

}
