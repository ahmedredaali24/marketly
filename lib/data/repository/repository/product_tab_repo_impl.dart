import 'package:dartz/dartz.dart';

import '../../../domin/enitity/ProductResponseEntity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/product_tab_remote_date_source.dart';
import '../../../domin/repository/repository/product_tab_repo.dart';


class ProductTabRepoImpl implements ProductTabRepo {
  ProductTabRemoteDateSource productTabRemoteDateSource;

  ProductTabRepoImpl({required this.productTabRemoteDateSource});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() {
    return productTabRemoteDateSource.getProducts();
  }
}
