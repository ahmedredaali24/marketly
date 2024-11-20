import 'package:dartz/dartz.dart';



import '../../../domin/enitity/GetCartResponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/cart_remote_data_sourse.dart';
import '../../../domin/repository/repository/cart_repo.dart';

class GetCartRepoImpl implements CartRepo {
  CartRemoteDataSource cartRemoteDataSource;

  GetCartRepoImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
    return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) {
    return cartRemoteDataSource.deleteItemInCart(productId);
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateInCart(
      String productId, int count) {
    return cartRemoteDataSource.updateInCart(productId, count);
  }
}
