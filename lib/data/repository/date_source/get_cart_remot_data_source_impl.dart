import 'package:dartz/dartz.dart';

import '../../../domin/enitity/GetCartResponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/cart_remote_data_sourse.dart';
import '../../api/get_cart_api_manger.dart';


class GetCartRemoteDataSourceImpl implements CartRemoteDataSource {

  GetCartApiManger cartApiManger;
  GetCartRemoteDataSourceImpl({required this.cartApiManger});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {

    var either = await cartApiManger.getCart();
    return either.fold((l) {
    return Left(l);
    }, (r) {
    return Right(r);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId) async {
    var either = await cartApiManger.deleteItemInCart(productId);
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateInCart(String productId, int count) async {
    var either = await cartApiManger.updateInCart(productId, count);

    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
