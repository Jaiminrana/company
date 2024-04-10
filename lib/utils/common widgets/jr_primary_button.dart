import 'package:flutter/material.dart';
import 'package:company/utils/extensions.dart';
import 'package:company/values/app_colors.dart';

class JrPrimaryButton extends StatelessWidget {
  const JrPrimaryButton({
    super.key,
    required this.title,
    this.titleColor,
    this.onTap,
    this.titleStyle,
    this.width,
    this.height,
    this.fontSize = 18,
    this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 70,
    ),
    this.color,
    this.borderColor = Colors.transparent,
    this.shape,
    this.weight = FontWeight.w400,
    this.maxLines,
    this.tapTargetSize,
    this.minimumButtonWidth = false,
    this.textAlign = TextAlign.center,
    this.textOverflow = TextOverflow.ellipsis,
    this.minimumSize = const MaterialStatePropertyAll(Size(20, 20)),
    this.isEnable = true,
    this.loading = false,
    this.loadingWidget = const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.orange),
      ),
    ),
  });

  final VoidCallback? onTap;
  final String title;
  final TextStyle? titleStyle;
  final double? width;
  final double? height;
  final double fontSize;
  final Widget? child;
  final EdgeInsets? padding;
  final Color? color;
  final Color borderColor;
  final OutlinedBorder? shape;
  final FontWeight weight;
  final int? maxLines;
  final Color? titleColor;
  final bool minimumButtonWidth;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final MaterialStateProperty<Size?> minimumSize;
  final MaterialTapTargetSize? tapTargetSize;
  final bool isEnable;
  final bool loading;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.16),
              offset: const Offset(6, 6),
              blurRadius: 12,
            ),
            BoxShadow(
              color: AppColors.white.withOpacity(0.04),
              offset: const Offset(-6, -6),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ]),
      child: ElevatedButton(
        style: context.theme.elevatedButtonTheme.style?.copyWith(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              side: BorderSide(
                color: borderColor,
              ),
            ),
          ),
          padding: padding != null ? MaterialStateProperty.all(padding) : null,
          backgroundColor:
              color != null ? MaterialStateProperty.all(color) : null,
          minimumSize: minimumSize,
          tapTargetSize: tapTargetSize,
        ),
        onPressed: isEnable && !loading ? onTap : null,
        child: loading && loadingWidget != null
            ? loadingWidget!
            : Text(
                title,
                maxLines: maxLines,
                textAlign: textAlign,
                overflow: textOverflow,
                style: titleStyle ??
                    TextStyle(
                      fontSize: fontSize,
                      fontWeight: weight,
                      color: isEnable && titleColor != null
                          ? titleColor
                          : isEnable
                              ? AppColors.lightOrange
                              : AppColors.yellow,
                    ),
              ),
      ),
    );
  }
}
