import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../auth/login_screen/login_screen.dart';
import '../../../../utils/custome_text_field_item.dart';
import '../../../../utils/my_colors.dart';
import '../../../../utils/shared_pre.dart';
import 'cubit/profile_tap_view_model.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  ProfileTabViewModel viewModel = ProfileTabViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Marketly",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.primaryColor,
                              fontFamily: "marketly_font"),
                        ),
                        IconButton(
                            onPressed: () {
                              SharedPre.removeData(key: 'Token');
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  LoginScreen.routeName, (route) => false);
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: AppColors.primaryColor,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "WELCOME, ${viewModel.nameController.text}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      viewModel.emailController.text,
                      style: TextStyle(color: AppColors.blueGryColor),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextFieldItem(
                      fieldName: 'Your Full Name',
                      hintText: viewModel.nameController.text,
                      controller: viewModel.nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter full name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: () {},
                    ),
                    CustomTextFieldItem(
                      fieldName: 'Your E-mail',
                      hintText: viewModel.emailController.text,
                      controller: viewModel.emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your email address';
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'invalid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      suffixIconFunction: () {},
                    ),
                    CustomTextFieldItem(
                      isObscure: true,
                      fieldName: 'Your Password',
                      hintText: viewModel.passwordController.text,
                      controller: viewModel.passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter password';
                        }
                        if (value.trim().length < 6 ||
                            value.trim().length > 30) {
                          return 'password should be >6 & <30';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: () {},
                    ),
                    CustomTextFieldItem(
                      fieldName: 'Your Mobile Number',
                      hintText: viewModel.phoneController.text,
                      controller: viewModel.phoneController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your mobile no';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconFunction: () {},
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
