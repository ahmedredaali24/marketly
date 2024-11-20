import 'package:dartz/dartz.dart';

import '../../../domin/enitity/AddCartResponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/add_cart_date_source.dart';
import '../../../domin/repository/repository/add_cart_repo.dart';


class AddCartRepoImpl implements AddCartRepo {
  AddCartDataSource addCartDataSource;

  AddCartRepoImpl({required this.addCartDataSource});

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId) {
    return addCartDataSource.addToCart(productId);
  }
}
