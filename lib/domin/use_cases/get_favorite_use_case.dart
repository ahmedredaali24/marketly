import 'package:dartz/dartz.dart';

import '../enitity/GetFavoriteresponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/get_fav_repo.dart';


class GetFavoriteUseCase {
  GetFavoriteRepo getFavoriteRepo;
  GetFavoriteUseCase({required this.getFavoriteRepo});

  Future<Either<Failures,GetFavoriteResponseEntity>>invoke(){
    return getFavoriteRepo.getFavorite();
  }
}