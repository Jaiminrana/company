import 'package:flutter/material.dart';
import 'package:company/utils/extensions.dart';
import 'package:company/values/app_colors.dart';
import 'package:company/values/app_constant.dart';
import 'package:company/values/app_strings.dart';

class SnackBarService {
  const SnackBarService._();

  static final GlobalKey<ScaffoldMessengerState> _key =
      GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get key => _key;

  static ScaffoldMessengerState? showSnack(
    String? message, {
    Color? color,
    String? title,
    TextStyle? textStyle,
  }) {
    return _key.currentState
      ?..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: AppColors.snackBarBg,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppConstant.roundedBorder10),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotNullOrEmpty) ...[
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: color ?? AppColors.orange,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                if (message.isNotNullOrEmpty)
                  Text(
                    message!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.red,
                      height: 1.5,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
  }
}
