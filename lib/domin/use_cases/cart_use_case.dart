import 'package:dartz/dartz.dart';


import '../enitity/AddCartResponseEntity.dart';
import '../enitity/GetCartResponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/cart_repo.dart';

class GetCartUseCase {
  CartRepo cartRepo;

  GetCartUseCase({required this.cartRepo});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartRepo.getCart();
  }
}
