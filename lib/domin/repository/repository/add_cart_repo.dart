import 'package:dartz/dartz.dart';


import '../../enitity/AddCartResponseEntity.dart';
import '../../enitity/failures.dart';

abstract class AddCartRepo{
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);

}