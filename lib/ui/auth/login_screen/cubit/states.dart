
import '../../../../domin/enitity/auth_result_Entity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String? errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  AuthResultEntity authResultEntity;

  LoginSuccessState({required this.authResultEntity});
}
