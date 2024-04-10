import 'package:flutter/material.dart';
import 'package:company/values/app_colors.dart';

class JRDivider extends StatelessWidget {
  const JRDivider({
    super.key,
    this.color,
    this.height = 1,
    this.thickness = 1,
    this.endIndent,
    this.indent,
  });

  final Color? color;
  final double height;
  final double thickness;
  final double? endIndent;
  final double? indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.dividerColor,
      height: height,
      thickness: thickness,
      endIndent: endIndent,
      indent: indent,
    );
  }
}
