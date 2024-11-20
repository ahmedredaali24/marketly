
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domin/di.dart';
import '../../home/home_screen/home_screen_view.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/my_colors.dart';
import '../../utils/shared_pre.dart';
import '../../utils/text_form_field_items.dart';
import '../register_screen/register_screen.dart';
import 'cubit/login_screen_view_model.dart';
import 'cubit/states.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(context: context, massage: "Loading...");
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                title: "error", context: context, massage: state.errorMessage!);
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                title: "success",
                context: context,
                massage: state.authResultEntity.userEntity?.name ?? "");
            SharedPre.saveData(
                key: "Token", value: state.authResultEntity.token);
            Navigator.of(context)
                .pushReplacementNamed(HomeScreenView.routeName);
          }
        },
        child: Scaffold(
          body: Container(

            color: Theme.of(context).primaryColor,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                    child: Image.asset(
                      'assets/images/Route.png',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Welcome Back To Route',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 24.sp),
                        ),
                        Text(
                          'Please sign in with your mail',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 16.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Form(
                            key: viewModel.formKey,
                            child: Column(
                              children: [
                                TextFormFieldItems(
                                  fieldName: 'E-mail address',
                                  hintText: 'enter your email address',
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
                                ),
                                TextFormFieldItems(
                                  fieldName: 'Password',
                                  hintText: 'enter your password',
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
                                  isObscure: viewModel.isObscure,
                                  suffixIcon: InkWell(
                                    child: viewModel.isObscure
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onTap: () {
                                      if (viewModel.isObscure) {
                                        viewModel.isObscure = false;
                                      } else {
                                        viewModel.isObscure = true;
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Forgot Password',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.whiteColor),
                          textAlign: TextAlign.end,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35.h),
                          child: ElevatedButton(
                            onPressed: () {
                              //todo: login
                              viewModel.login();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.r)))),
                            child: Container(
                              height: 64.h,
                              width: 398.w,
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: AppColors.primaryColor,
                                          fontSize: 20.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account? ',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(RegisterScreen.routeName);
                                },
                                child: Text(
                                  'Create',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
