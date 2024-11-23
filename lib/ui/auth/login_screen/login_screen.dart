import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domin/di.dart';
import '../../home/home_screen/home_screen_view.dart';
import '../../utils/BackgroundImageContainer.dart';
import '../../utils/CustomRichText.dart';
import '../../utils/PrimaryButton.dart';
import '../../utils/PrimaryTextFormField.dart';
import '../../utils/SecondaryButton.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/my_assets.dart';
import '../../utils/my_colors.dart';
import '../../utils/shared_pre.dart';

import '../register_screen/register_screen.dart';
import 'cubit/login_screen_view_model.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  LoginScreen({super.key});

  final LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(
              context: context,
              massage: "Loading...",
            );
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              title: "Error",
              context: context,
              massage: state.errorMessage!,
              isDismissible: true,
            );
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            SharedPre.saveData(
                key: "Token", value: state.authResultEntity.token);
            Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreenView.routeName, (route) => false);
          }
        },
        child: BackgroundImageContainer(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 235.h,
                  right: 263.w,
                  bottom: 15.h,
                  left: 32.w,
                ),
                child: Text('LogIn',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.w900)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),

                ///main Container
                child: Container(
                  width: 350.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.kSamiDarkColor.withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kSamiDarkColor.withOpacity(0.5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.greenColor)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),

                        ///text form field email
                        PrimaryTextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                          hintText: 'Email',
                          controller: viewModel.emailController,
                          width: 326.w,
                          height: 48.h,
                          fillColor: AppColors.kLightAccentColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .015,
                        ),

                        ///text form field password
                        PrimaryTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          isObscure: viewModel.isObscure,
                          suffixIcon: BlocBuilder(
                            bloc: viewModel,
                            builder: (context, state) {
                              return InkWell(
                                child: viewModel.isObscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onTap: () {
                                  viewModel.changeObscure();
                                },
                              );
                            },
                          ),
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
                          hintText: 'password',
                          controller: viewModel.passwordController,
                          width: 326.w,
                          height: 48.h,
                          fillColor: AppColors.kLightAccentColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),

                        ///Next button
                        PrimaryButton(
                          onTap: () async {
                            viewModel.login();
                          },
                          borderRadius: 8.r,
                          fontSize: 14.sp,
                          height: 48.h,
                          width: 326.w,
                          text: 'Login',
                          textColor: AppColors.kWhiteColor,
                          bgColor: AppColors.primaryColor,
                        ),


                        SizedBox(
                          height: MediaQuery.of(context).size.height * .015,
                        ),
                        Center(
                          child: CustomRichText(
                            subtitle: ' sign in ',
                            title: ' Don’t have an account?',
                            subtitleTextStyle: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                            onTab: () {
                              Navigator.of(context).pushReplacementNamed(
                                  RegisterScreen.routeName);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        )));
  }
}
