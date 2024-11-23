import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    elevation: 0,
    backgroundColor: Colors.transparent,
    showUnselectedLabels: false,
    showSelectedLabels: false,
    currentIndex: selectedIndex,
    onTap: onTapFunction,

    items: [
      BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor: selectedIndex == 0
                ? AppColors.primaryColor
                : AppColors.whiteColor,
            backgroundColor: selectedIndex == 0
                ? AppColors.whiteColor
                : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              const AssetImage(
                "assets/icons/home_icon_not_selected.png",
              ),
            ),
          ),
          label: "HOME"),
      BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor: selectedIndex == 1
                ? AppColors.primaryColor
                : AppColors.whiteColor,
            backgroundColor: selectedIndex == 1
                ? AppColors.whiteColor
                : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              const AssetImage(
                MyAssets.notSelectedCategoryIcon,
              ),
            ),
          ),
          label: "CATEGORY"),
      BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor: selectedIndex == 2
                ? AppColors.primaryColor
                : AppColors.whiteColor,
            backgroundColor: selectedIndex == 2
                ? AppColors.whiteColor
                : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              const AssetImage(
                MyAssets.notSelectedWishlistIcon,
              ),
            ),
          ),
          label: "WISHLIST"),
      BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundColor: selectedIndex == 3
                ? AppColors.primaryColor
                : AppColors.whiteColor,
            backgroundColor: selectedIndex == 3
                ? AppColors.whiteColor
                : Colors.transparent,
            radius: 20.r,
            child: ImageIcon(
              size: 40.sp,
              const AssetImage(
                MyAssets.notSelectedAccountIcon,
              ),
            ),
          ),
          label: "ACCOUNT")
    ],
  );
}
