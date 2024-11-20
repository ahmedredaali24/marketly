import 'package:dartz/dartz.dart';

import '../../../domin/enitity/ProductResponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/product_tab_remote_date_source.dart';
import '../../api/products_api_manger.dart';


class ProductTabRemoteDateSourceImpl implements ProductTabRemoteDateSource {
  ProductsApiManger productsApiManger;

  ProductTabRemoteDateSourceImpl({required this.productsApiManger});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await productsApiManger.getProduct();
    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
