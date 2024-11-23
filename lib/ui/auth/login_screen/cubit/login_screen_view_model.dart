import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:marketly/ui/auth/login_screen/cubit/states.dart';

import '../../../../domin/use_cases/login_use_case.dart';
import '../../../utils/shared_pre.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  LoginUseCase loginUseCase;
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isObscure = true;

  changeObscure() {
    if (isObscure) {
      isObscure = false;
    } else {
      isObscure = true;
    }
    emit(LoginIsObscureState());
  }

  void login() async {
  if(formKey.currentState!.validate()){
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((l) => emit(LoginErrorState(errorMessage: l.errorMessage)),
            (response) => emit(LoginSuccessState(authResultEntity: response)));
  }
  }

  void saveLoginData() async {
    await SharedPre.saveData(key: 'email', value: emailController.text);

    await SharedPre.saveData(key: 'password', value: passwordController.text);
  }
}
