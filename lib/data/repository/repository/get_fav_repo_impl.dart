import 'package:dartz/dartz.dart';



import '../../../domin/enitity/FavoriteresponseEntity.dart';
import '../../../domin/enitity/GetFavoriteresponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/get_fav_remote_data_sourse.dart';
import '../../../domin/repository/repository/get_fav_repo.dart';

class GetFavoriteRepoImpl extends GetFavoriteRepo {
  GetFavoriteRemoteDataSource getFavoriteRemoteDataSource;


  GetFavoriteRepoImpl({required this.getFavoriteRemoteDataSource});

  @override
  Future<Either<Failures, GetFavoriteResponseEntity>> getFavorite() {
    return getFavoriteRemoteDataSource.getFavorite();
  }

  @override
  Future<Either<Failures, FavoriteResponseEntity>> deleteFavorite(String productId) {
    return getFavoriteRemoteDataSource.deleteFavorite(productId);
  }
}
