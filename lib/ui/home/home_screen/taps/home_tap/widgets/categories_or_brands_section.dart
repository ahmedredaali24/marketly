import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../domin/enitity/CategoryOrBrandResponseEntity.dart';
import 'category_item.dart';

class CategoriesOrBrandsSection extends StatelessWidget {
  List<CategoryOrBrandEntity> categoriesOrBrandsList;

  CategoriesOrBrandsSection({super.key, required this.categoriesOrBrandsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
          itemCount: categoriesOrBrandsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(
              categoryOrBrandEntity: categoriesOrBrandsList[index],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          )),
    );
  }
}
