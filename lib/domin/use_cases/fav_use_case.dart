import 'package:dartz/dartz.dart';


import '../enitity/AddCartResponseEntity.dart';
import '../enitity/FavoriteresponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/fav_repo.dart';

class FavoriteUseCase {
  FavoriteRepo favoriteRepo;
  FavoriteUseCase({required this.favoriteRepo});

  Future<Either<Failures, FavoriteResponseEntity>> invoke(String productId){
   return favoriteRepo.addToFavCart(productId);
  }
}