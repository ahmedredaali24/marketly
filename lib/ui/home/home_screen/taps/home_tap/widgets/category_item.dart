import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../domin/enitity/CategoryOrBrandResponseEntity.dart';
import '../../../../../utils/my_colors.dart';

class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrandEntity categoryOrBrandEntity;

  CategoryOrBrandItem({super.key, required this.categoryOrBrandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(categoryOrBrandEntity.image ?? ""),
            radius: 50.r,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            categoryOrBrandEntity.name ?? "",
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
        )
      ],
    );
  }
}
