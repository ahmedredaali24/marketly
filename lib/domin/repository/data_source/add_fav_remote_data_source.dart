import 'package:dartz/dartz.dart';

import '../../enitity/FavoriteresponseEntity.dart';
import '../../enitity/failures.dart';

abstract class FavRemoteDataSource {
  Future<Either<Failures, FavoriteResponseEntity>> addToFavCart(String productId);

}