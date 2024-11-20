import 'package:dartz/dartz.dart';

import '../../../domin/enitity/FavoriteresponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/add_fav_remote_data_source.dart';
import '../../api/fav_api_manger.dart';


class FavoriteDataSourceImpl implements FavRemoteDataSource {
  FavoriteApiManger favoriteApiManger;

  FavoriteDataSourceImpl({required this.favoriteApiManger});

  @override
  Future<Either<Failures, FavoriteResponseEntity>> addToFavCart(
      String productId) async {
    var either = await favoriteApiManger.addToFavorite(productId);
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
