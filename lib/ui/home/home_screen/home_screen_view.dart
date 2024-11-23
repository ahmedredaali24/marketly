import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketly/ui/home/home_screen/widget/custom_bottom_navigation_bar.dart';
import 'package:marketly/ui/utils/my_colors.dart';

import '../cart/cart_screen.dart';
import 'cubit/home_screen_view_model.dart';
import 'cubit/home_states.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = "HomeScreenView";

  HomeScreenView({super.key});

  final HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: ClipRRect(
              borderRadius: BorderRadius.circular(22.r),
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: AppColors.lightGreyColor,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                child: Padding(
                  padding: EdgeInsets.all(3.r),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: 2.w, left: 2.w, right: 2.w),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.r),
                  topRight: Radius.circular(70.r),
                  bottomLeft: Radius.circular(70.r),
                  bottomRight: Radius.circular(100.r),
                ),
                child: BottomAppBar(
                  color: AppColors.primaryColor,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 12,
                  child: buildCustomBottomNavigationBar(
                    context: context,
                    selectedIndex: viewModel.selectedIndex,
                    onTapFunction: (index) {
                      viewModel.changeSelectedIndex(index);
                    },
                  ),
                ),
              ),
            ),
            body: viewModel.tabs[viewModel.selectedIndex],
          );
        });
  }
}
