import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:company/utils/extensions.dart';

class JrScaffold extends StatelessWidget {
  const JrScaffold({
    super.key,
    required this.child,
    required this.title,
    this.onTap,
    this.onTitleTap,
  });

  final Widget child;
  final String title;
  final VoidCallback? onTap;
  final VoidCallback? onTitleTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: CupertinoColors.black,
          centerTitle: true,
          title: GestureDetector(
            onTap: onTitleTap?.call,
            child: Text(
              title,
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
