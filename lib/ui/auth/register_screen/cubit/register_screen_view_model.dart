import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marketly/domin/enitity/UserEnitity.dart';
import 'package:marketly/domin/enitity/auth_result_Entity.dart';
import 'package:marketly/ui/auth/register_screen/cubit/states.dart';

import '../../../../domin/use_cases/google_register_use_case.dart';
import '../../../../domin/use_cases/register_use_case.dart';
import '../../../utils/shared_pre.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;
  final GoogleRegisterUseCase googleRegisterUseCase;

  RegisterScreenViewModel(
      {required this.googleRegisterUseCase, required this.registerUseCase})
      : super(RegisterInitialState());
  bool isObscure = true;
  bool isObscureRe = true;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();


  changeObscureRe() {
    if (isObscureRe) {
      isObscureRe = false;
    } else {
      isObscureRe = true;
    }
    emit(RegisterIsObscureReState());
  }

  changeObscure() {
    if (isObscure) {
      isObscure = false;
    } else {
      isObscure = true;
    }
    emit(RegisterIsObscureReState());
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          confirmationPasswordController.text,
          phoneController.text);
      either.fold((l) => emit(RegisterErrorState(errorMessage: l.errorMessage)),
              (response) =>
              emit(RegisterSuccessState(authResultEntity: response)));
      saveRegistrationData();
    }
  }



  void saveRegistrationData() async {
    await SharedPre.saveData(key: 'name', value: nameController.text);
    await SharedPre.saveData(key: 'email', value: emailController.text);
    await SharedPre.saveData(key: 'phone', value: phoneController.text);
    await SharedPre.saveData(key: 'password', value: passwordController.text);
  }
}
