import 'package:flutter/material.dart';
import 'package:company/values/app_colors.dart';

class JrOpaqueDivider extends StatelessWidget {
  const JrOpaqueDivider({
    super.key,
    this.margin,
    this.height =2,
  });

  final EdgeInsets? margin;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.white0,
            AppColors.fullBlack,
            AppColors.white0,
          ],
        ),
      ),
    );
  }
}
