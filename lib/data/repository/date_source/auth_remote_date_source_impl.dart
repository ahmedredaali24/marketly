import 'package:dartz/dartz.dart';

import '../../../domin/enitity/auth_result_Entity.dart';
import '../../../domin/enitity/failures.dart';
import '../../../domin/repository/data_source/auth_remote_date_source.dart';
import '../../api/auth_api_manger.dart';


class AuthRemoteDateSourceImpl implements AuthRemoteDateSource {
  ApiManger apiManger;

  AuthRemoteDateSourceImpl({required this.apiManger});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) async {
    var either =
    await apiManger.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManger.login(email, password);

    return either.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r.toAuthResultEntity());
    });
  }
}
