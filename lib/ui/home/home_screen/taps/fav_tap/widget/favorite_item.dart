
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../domin/enitity/GetFavoriteresponseEntity.dart';
import '../../../../../utils/my_colors.dart';
import '../cubit/favorite_view_model.dart';

class FavoriteItem extends StatelessWidget {
  GetFavDataEntity getFavDataEntity;

  FavoriteItem({super.key, required this.getFavDataEntity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
            // color: Colors.red,
            border: Border.all(color: AppColors.primaryColor,width: .8),
            borderRadius: BorderRadius.circular(20)),
        height: 150,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("${getFavDataEntity.imageCover}")),
                  border: Border.all(color: AppColors.blackColor, width: 0.5),
                  borderRadius: BorderRadius.circular(20)),
              height: 165.h,
              width: 120.w,
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 150,
              width: 160,
              // color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${getFavDataEntity.title}",style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.primaryColor,overflow:TextOverflow.ellipsis ),),
                  Text("${getFavDataEntity.brand?.slug}",style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.gryColor),),
                  Text("EGP ${getFavDataEntity.price}",style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryColor),),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              // color: Colors.green,
              height: 150,
              width: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      FavoriteViewModel.get(context).deleteFavorite(getFavDataEntity.id??"");
                    },
                    icon: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      radius: 20.r,
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.primaryColor,
                        size: 30.sp,
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    onPressed: () {},
                    child: Text("Add To Cart", style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.whiteColor),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
