import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:company/utils/typedefs.dart';
import 'package:company/values/app_colors.dart';
import 'package:company/values/app_strings.dart';

extension FocusNodeExtension on FocusNode {
  void unFocus() => hasFocus ? unfocus() : null;
}

extension ContextExtension on BuildContext {
  void unFocusField() {
    FocusScope.of(this).unFocus();
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
  }

//THEME Related extensions
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  double heightFraction({double sizeFraction = 1}) =>
      MediaQuery.sizeOf(this).height * (sizeFraction);

  double widthFraction({double sizeFraction = 1}) =>
      MediaQuery.sizeOf(this).width * sizeFraction;
}

extension NullableStringExtension on String? {
  /// Returns true if [this] is neither null nor empty string.
  bool get isNotNullOrEmpty => this?.trim().isNotEmpty ?? false;

  bool get isNullOrEmpty => this?.trim().isEmpty ?? true;
}

extension StringExtension on String {
  String padding(int width, {String padding = AppStrings.blankString}) =>
      padLeft(width, padding).padRight(width, padding);
}

extension WidgetExtension on Widget {
  Widget wwithProviderValue<P>(P provider) => Provider<P>.value(
        value: provider,
        child: this,
      );

  Widget withProvider<P>(P provider, {DisposeProvider<P>? dispose}) =>
      Provider<P>(
        create: (_) => provider,
        dispose: (_, value) => dispose?.call(value),
        child: this,
      );

  Future<P?> showBottomSheet<P>({
    required BuildContext context,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    Color backgroundColor = AppColors.transparent,
    String? barrierLabel,
    double? elevation = 0,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool useRootNavigator = false,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) {
    return showModalBottomSheet<P>(
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (context) => this,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      barrierLabel: barrierLabel,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      useRootNavigator: useRootNavigator,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
    );
  }
}
