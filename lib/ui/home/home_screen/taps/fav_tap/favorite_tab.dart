
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketly/ui/home/home_screen/taps/fav_tap/widget/favorite_item.dart';

import '../../../../../domin/di.dart';
import '../../../../utils/custom_text_field.dart';
import '../../../../utils/my_assets.dart';
import '../../../../utils/my_colors.dart';
import '../../../cart/cart_screen.dart';
import 'cubit/favorite_states.dart';
import 'cubit/favorite_view_model.dart';

class FavoriteTab extends StatelessWidget {
  static const String routeName = 'FavoriteTab';
  FavoriteViewModel viewModel =
      FavoriteViewModel(getFavoriteUseCase: injectGetFavoriteUseCase(),favoriteUseCase: injectFavoriteUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteViewModel>(
      create: (context)=>viewModel..getFavorite(),
      child: BlocBuilder<FavoriteViewModel, FavoriteStates>(
          // bloc: viewModel..getFavorite(),
          builder: (context, state) {
            return Padding(
                padding: EdgeInsets.zero,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      Row(children: [
                        Expanded(
                          child: CustomTextField(),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(CartScreen.routeName);
                          },
                          child: Badge(
                            label: Text(viewModel.numOfCartItem.toString()),
                            child: ImageIcon(
                              const AssetImage(MyAssets.shoppingCart),
                              size: 28.sp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 24.h,
                      ),
                      state is FavoriteSuccessState
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return FavoriteItem(
                                      getFavDataEntity: state
                                          .favoriteResponseEntity.data![index]);
                                },
                                itemCount:
                                    state.favoriteResponseEntity.data!.length,
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ))
                    ]));
          }),
    );
  }
}
