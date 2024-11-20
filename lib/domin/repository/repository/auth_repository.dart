import 'package:dartz/dartz.dart';

import '../../enitity/auth_result_Entity.dart';
import '../../enitity/failures.dart';


abstract class AuthRepositoryContract{

  Future<Either<Failures,AuthResultEntity>> register(String name , String email , String password,
      String rePassword, String phone);

  Future<Either<Failures,AuthResultEntity>> login(String email , String password);

}