import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../utils/shared_pre.dart';
import 'ProfileTabStates.dart';

class ProfileTabViewModel extends Cubit<ProfileTabStates> {
  ProfileTabViewModel() :super(ProfileTabInitialStates());

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var passwordController = TextEditingController();

  var addressController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  bool isObsecure = true;



  void loadUserData() async {
    nameController.text = SharedPre.getDate(key: 'name') as String? ?? '';
    emailController.text = SharedPre.getDate(key: 'email') as String? ?? '';
    phoneController.text = SharedPre.getDate(key: 'phone') as String? ?? '';
    passwordController.text =
        SharedPre.getDate(key: "password") as String? ?? "";
    addressController.text = SharedPre.getDate(key: 'address') as String? ?? '';
  }

}