import 'package:dartz/dartz.dart';


import '../enitity/AddCartResponseEntity.dart';
import '../enitity/FavoriteresponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/get_fav_repo.dart';

class DeleteFavoriteCartUseCase {
  GetFavoriteRepo getFavoriteRepo;

  DeleteFavoriteCartUseCase({required this.getFavoriteRepo});

  Future<Either<Failures, FavoriteResponseEntity>> invoke(String productId) {
    return getFavoriteRepo.deleteFavorite(productId);
  }
}
