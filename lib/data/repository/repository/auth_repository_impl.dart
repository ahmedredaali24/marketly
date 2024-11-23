import 'package:dartz/dartz.dart';

import '../../../domin/enitity/auth_result_Entity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/auth_remote_date_source.dart';
import '../../../domin/repository/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDateSource remoteDateSource;

  AuthRepositoryImpl({required this.remoteDateSource});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) {
    return remoteDateSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) {
    return remoteDateSource.login(email, password);
  }

  @override
  Future registerByGoogle() {
    return remoteDateSource.registerByGoogle();
  }
}
