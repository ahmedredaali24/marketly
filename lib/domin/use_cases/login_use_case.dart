import 'package:dartz/dartz.dart';

import '../enitity/auth_result_Entity.dart';
import '../enitity/failures.dart';
import '../repository/repository/auth_repository.dart';

class LoginUseCase{
  AuthRepositoryContract authRepository ;
  LoginUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(String email,String password){
    return authRepository.login(email, password);
  }

}