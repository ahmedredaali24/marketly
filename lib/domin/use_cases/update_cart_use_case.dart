import 'package:dartz/dartz.dart';


import '../enitity/AddCartResponseEntity.dart';
import '../enitity/GetCartResponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/cart_repo.dart';

class UpdateGetCartUseCase {
  CartRepo cartRepo;

  UpdateGetCartUseCase({required this.cartRepo});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepo.updateInCart(productId, count);
  }
}
