import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domin/di.dart';
import '../../utils/BackgroundImageContainer.dart';
import '../../utils/CustomRichText.dart';
import '../../utils/PrimaryButton.dart';
import '../../utils/PrimaryTextFormField.dart';
import '../../utils/SecondaryButton.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/my_assets.dart';
import '../../utils/my_colors.dart';
import '../login_screen/login_screen.dart';
import 'cubit/register_screen_view_model.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  final RegisterScreenViewModel viewModel = RegisterScreenViewModel(
      registerUseCase: injectRegisterUseCase(),
      googleRegisterUseCase: injectGoogleRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: viewModel,
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(context: context, massage: "Loading...");
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                title: "Error",
                massage: state.errorMessage!,
                isDismissible: true);
          } else if (state is RegisterSuccessState) {
            DialogUtils.showMessage(
                context: context,
                massage:
                    "create New User : \n${state.authResultEntity.userEntity?.name ?? " "}",
                title: "Success",
                nagActionName: "ok",
                nagAction: () async {
                  DialogUtils.showLoading(
                      context: context, massage: "Loading...");
                  await Future.delayed(Duration(seconds: 3));
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                });
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
                child: Text('Sign Up',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.w900)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),

                ///main Container
                child: Container(
                  width: 358.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.kSamiDarkColor.withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kSamiDarkColor.withOpacity(0.5),
                        blurRadius: 10.r,
                      ),
                    ],
                  ),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Let's create a new account for you.",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.greenColor)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),

                        ///text form field Name
                        PrimaryTextFormField(
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "please enter your name";
                            }
                            return null;
                          },
                          hintText: 'Name',
                          controller: viewModel.nameController,
                          width: 326.w,
                          height: 48.h,
                          fillColor: AppColors.kLightAccentColor,
                        ),
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
                                    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                          height: MediaQuery.of(context).size.height * .02,
                        ),

                        ///text form field Password
                        BlocBuilder(
                          bloc: viewModel,
                          builder: (context, state) {
                            return PrimaryTextFormField(
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
                              hintText: 'Password',
                              controller: viewModel.passwordController,
                              width: 326.w,
                              height: 48.h,
                              fillColor: AppColors.kLightAccentColor,
                            );
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),

                        ///text form field Confirm Password
                        BlocBuilder(
                          bloc: viewModel,
                          builder: (context, state) {
                            return PrimaryTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              isObscure: viewModel.isObscureRe,
                              suffixIcon: BlocBuilder(
                                bloc: viewModel,
                                builder: (context, state) {
                                  return InkWell(
                                    child: viewModel.isObscureRe
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onTap: () {
                                      viewModel.changeObscureRe();
                                    },
                                  );
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter rePassword';
                                }
                                if (value !=
                                    viewModel.passwordController.text) {
                                  return "Password doesn't match";
                                }
                                return null;
                              },
                              hintText: 'Confirmation Password',
                              controller:
                                  viewModel.confirmationPasswordController,
                              width: 326.w,
                              height: 48.h,
                              fillColor: AppColors.kLightAccentColor,
                            );
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),

                        ///text form field phone Number
                        PrimaryTextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'please enter your mobile num';
                            }
                            return null;
                          },
                          hintText: 'Mobile Number',
                          controller: viewModel.phoneController,
                          width: 326.w,
                          height: 48.h,
                          fillColor: AppColors.kLightAccentColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),

                        ///Next button
                        PrimaryButton(
                          onTap: () async {
                            viewModel.register();
                          },
                          borderRadius: 8.r,
                          fontSize: 14.sp,
                          height: 48.h,
                          width: 326.w,
                          text: 'Create Account',
                          textColor: AppColors.kWhiteColor,
                          bgColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 28,
                          child: Center(
                              child: Text(
                            "or",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.sp),
                          )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .015,
                        ),
                        SecondaryButton(
                            onTap: () async {},
                            borderRadius: 8.r,
                            fontSize: 14.sp,
                            height: 48.h,
                            width: 326.w,
                            text: 'Create with Google',
                            textColor: AppColors.kBlackColor,
                            bgColor: AppColors.kLightAccentColor,
                            icons: MyAssets.kGoogleLogo),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Center(
                          child: CustomRichText(
                            subtitle: ' LogIn ',
                            title: ' Already have an account?',
                            subtitleTextStyle: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                            onTab: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
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
