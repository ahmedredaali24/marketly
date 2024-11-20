import 'package:dartz/dartz.dart';
import '../enitity/auth_result_Entity.dart';
import '../enitity/failures.dart';
import '../repository/repository/auth_repository.dart';

class RegisterUseCase{
  AuthRepositoryContract authRepository ;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(String name , String email , String password,
      String rePassword, String phone){
    return authRepository.register(name, email, password, rePassword, phone);
  }
}