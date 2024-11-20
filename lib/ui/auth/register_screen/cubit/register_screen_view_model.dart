
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:marketly/ui/auth/register_screen/cubit/states.dart';

import '../../../../domin/use_cases/register_use_case.dart';
import '../../../utils/shared_pre.dart';


class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  bool isObscure = true;
  bool isObscureRe = true;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: '');
  var passwordController = TextEditingController(text: '');
  var confirmationPasswordController = TextEditingController(text: '');
  var emailController = TextEditingController(text: '');
  var phoneController = TextEditingController(text: '');
  RegisterUseCase registerUseCase;
  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmationPasswordController.text,
        phoneController.text);
    either.fold((l) => emit(RegisterErrorState(errorMessage: l.errorMessage)),
        (response) => emit(RegisterSuccessState(authResultEntity: response)));
    saveRegistrationData();
  }

  void saveRegistrationData() async {
    await SharedPre.saveData(key: 'name', value: nameController.text);
    await SharedPre.saveData(key: 'email', value: emailController.text);
    await SharedPre.saveData(key: 'phone', value: phoneController.text);
    await SharedPre.saveData(key: 'password', value: passwordController.text);
  }
}
