import 'package:flutter/material.dart';
import 'package:marketly/ui/utils/my_assets.dart';


class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                MyAssets.background,
              ),
              fit: BoxFit.cover)),
      child: child,
    );
  }
}
