import 'package:dartz/dartz.dart';


import '../../../domin/enitity/FavoriteresponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/add_fav_remote_data_source.dart';
import '../../../domin/repository/repository/fav_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  FavRemoteDataSource favRemoteDataSource;

  FavoriteRepoImpl({required this.favRemoteDataSource});

  @override
  Future<Either<Failures, FavoriteResponseEntity>> addToFavCart(String productId) {
    return favRemoteDataSource.addToFavCart(productId);
  }
}
