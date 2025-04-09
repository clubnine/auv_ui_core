import 'package:auv_core/auv_ui_core/auv_image_local.dart';
import 'package:auv_core/auv_ui_core/auv_image_net.dart';
import 'package:flutter/material.dart';

class AuvIcon {
  /// 创建图片Widget
  /// [url] 图片路径(本地或网络)
  /// [width] 图片宽度
  /// [height] 图片高度
  /// [opacity] 透明度(0.0-1.0)
  static Widget image(String url, double width, {double? height, double opacity = 1.0}) {
    // 若高度未设置，则宽度与高度相同
    height ??= width;

    if (opacity == 1.0) {
      return _getImageWidget(url, width, height);
    } else {
      return Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: _getImageWidget(url, width, height),
      );
    }
  }

  static Widget circle(Widget icon, double radius, {Color? color, Color? borderColor, double borderWidth = 0.0}) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: radius * 2,
      height: radius * 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius), border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth)),
      child: icon,
    );
  }

  /// 创建ImageProvider
  /// [url] 图片路径(本地或网络)
  static ImageProvider provider(String url) {
    if (url.startsWith('http')) {
      return AuvImageNet.provider(url);
    } else {
      return AuvImageLocal.assetProvider(url);
    }
  }

  // 内部方法：获取图片Widget
  static Widget _getImageWidget(
    String url,
    double? width,
    double? height,
  ) {
    if (url.startsWith('http')) {
      return AuvImageNet.orign(
        url: url,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else {
      return AuvImageLocal.local(fileName: url, width: width, height: height, fit: BoxFit.cover);
    }
  }
}
