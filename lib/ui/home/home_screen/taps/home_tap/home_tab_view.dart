
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketly/ui/home/home_screen/taps/home_tap/widgets/annountcements_section.dart';
import 'package:marketly/ui/home/home_screen/taps/home_tap/widgets/categories_or_brands_section.dart';
import 'package:marketly/ui/home/home_screen/taps/home_tap/widgets/row_section_widgets.dart';

import '../../../../../domin/di.dart';
import '../../../../utils/custom_search_with_shopping_cart.dart';
import '../../../../utils/my_colors.dart';
import 'cubit/home_tab_states.dart';
import 'cubit/home_tab_view_model.dart';

class HomeTapView extends StatelessWidget {
  HomeTapView({super.key});

  HomeTabViewModel viewModel =
      HomeTabViewModel(categoriesUseCase: injectGetAllCategoriesUseCase(), brandesUseCase: injectGetAllBrandesUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel..getAllCategories()..getAllBrandes(),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    "assets/icons/route_logo.png",
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomSearchWithShoppingCart(),
                  SizedBox(
                    height: 16.h,
                  ),
                  AnnouncementsSection(),
                  SizedBox(
                    height: 16.h,
                  ),
                  RowSectionWidget(name: 'Categories'),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is CategoryOrBrandLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : CategoriesOrBrandsSection(
                          categoriesOrBrandsList: viewModel.categoryList,
                        ),
                  SizedBox(
                    height: 24.h,
                  ),
                  RowSectionWidget(name: 'Brands'),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is CategoryOrBrandLoadingState?
                  const Center(child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),):
                  CategoriesOrBrandsSection(categoriesOrBrandsList:viewModel.brandesList ,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
