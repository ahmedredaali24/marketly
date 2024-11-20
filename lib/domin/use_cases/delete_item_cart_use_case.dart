import 'package:dartz/dartz.dart';


import '../enitity/AddCartResponseEntity.dart';
import '../enitity/GetCartResponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/cart_repo.dart';

class DeleteItemGetCartUseCase {
  CartRepo cartRepo;

  DeleteItemGetCartUseCase({required this.cartRepo});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId) {
    return cartRepo.deleteItemInCart(productId);
  }
}

