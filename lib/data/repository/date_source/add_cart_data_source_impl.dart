import 'package:dartz/dartz.dart';

import '../../../domin/enitity/AddCartResponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/add_cart_date_source.dart';
import '../../api/add_cart_api_manger.dart';


class AddCartDataSourceImpl implements AddCartDataSource {
  AddCartApiManger addCartApiManger;

  AddCartDataSourceImpl({required this.addCartApiManger});

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(
      String productId) async {
    var either = await addCartApiManger.addToCart(productId);
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
