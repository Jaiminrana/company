import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:company/resources/resources.dart';
import 'package:company/utils/common%20widgets/jr_svg_picture.dart';
import 'package:company/values/app_colors.dart';

class JRNetworkImage extends StatelessWidget {
  const JRNetworkImage({
    required this.url,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.borderRadius,
    this.color = AppColors.transparent,
    this.blendMode = BlendMode.multiply,
    this.placeHolderHeight,
    this.placeholderWidth,
    super.key,
  });

  const JRNetworkImage.oval({
    required this.url,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.color = AppColors.transparent,
    this.blendMode = BlendMode.multiply,
    this.borderRadius = const BorderRadius.all(Radius.circular(100)),
    this.placeHolderHeight,
    this.placeholderWidth,
    super.key,
  });

  final String url;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final double? placeHolderHeight;
  final double? placeholderWidth;
  final BorderRadiusGeometry? borderRadius;
  final Color color;
  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          color,
          blendMode,
        ),
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: BlendMode.darken,
          imageUrl: url,
          errorWidget: (_, __, error) {
            debugPrint(error.toString());
            return const JRPlaceHolder();
          },
          placeholder: (_, __) => JRPlaceHolder(
            height: placeHolderHeight,
            width: placeholderWidth,
          ),
        ),
      ),
    );
  }
}

class JRPlaceHolder extends StatelessWidget {
  const JRPlaceHolder({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        color: Colors.white12,
        child: const JRSvgPicture(
          assetName: Vectors.imagePlaceholder,
        ));
  }
}
