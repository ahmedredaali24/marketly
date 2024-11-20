import 'package:dartz/dartz.dart';

import '../enitity/AddCartResponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/add_cart_repo.dart';

class AddCartUseCase {
  AddCartRepo addCartRepo;
  AddCartUseCase({required this.addCartRepo});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId){
   return addCartRepo.addToCart(productId);
  }
}