import 'package:dartz/dartz.dart';


import '../../enitity/FavoriteresponseEntity.dart';
import '../../enitity/GetFavoriteresponseEntity.dart';
import '../../enitity/failures.dart';

abstract class GetFavoriteRemoteDataSource {
  Future<Either<Failures, GetFavoriteResponseEntity>> getFavorite();
  Future<Either<Failures, FavoriteResponseEntity>> deleteFavorite(String productId);



}