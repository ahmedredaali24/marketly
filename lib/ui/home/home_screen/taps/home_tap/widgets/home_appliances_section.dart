import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/my_colors.dart';
import '../../../../widgets/item_card.dart';


class HomeAppliancesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Home Appliance",
          style: TextStyle(color: AppColors.blackColor, fontSize: 18.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.235,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                  child: ItemCardHome(),
                );
              }),
        ),
      ],
    );
  }
}
