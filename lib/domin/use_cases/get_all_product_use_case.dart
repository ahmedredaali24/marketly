import 'package:dartz/dartz.dart';


import '../enitity/CategoryOrBrandResponseEntity.dart';
import '../enitity/ProductResponseEntity.dart';
import '../enitity/failures.dart';
import '../repository/repository/product_tab_repo.dart';

class GetAllProductUseCase {
  ProductTabRepo productTabRepo;

  GetAllProductUseCase({required this.productTabRepo});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return productTabRepo.getProducts();
  }
}
