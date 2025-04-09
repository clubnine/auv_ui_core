import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'auv_image_local.dart';
import 'auv_image_net.dart';

/// 图片加载统一入口类，代理本地和网络图片加载功能
class AuvImage {
  /// 加载本地图片
  ///  [fileName] 图片名称
  ///  [width]
  ///  [height]
  ///  [fit] :图片填充方式，默认BoxFit.fill
  ///  [color] :图片颜色
  ///  [ext] :图片格式，默认png
  static Widget local({
    required String fileName,
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    String? ext,
  }) {
    return AuvImageLocal.local(
        fileName: fileName,
        width: width,
        height: height,
        fit: fit,
        color: color,
        ext: ext);
  }

  /// 加载文件图片
  ///  [fileName] 完整的文件路径
  /// [fit] 图片填充模式
  /// [width] 图片宽度
  /// [height] 图片高度
  ///  [fit] 图片填充模式
  static Widget file(
      {required String fileName, double? width, double? height, BoxFit? fit}) {
    return AuvImageLocal.file(
      fileName: fileName,
      width: width,
      height: height,
      fit: fit,
    );
  }

  /// 加载网络图片
  /// [url] 图片URL地址
  /// [width] 图片宽度
  /// [height] 图片高度
  /// [fit] 图片填充模式
  /// [clip] 如果没有传递，那么会自动根据width和height来判断是否需要裁切
  /// [borderRadius] 圆角半径
  /// [placeHolder] 加载占位图
  static Widget network({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    ImageClipType? clip,
    BorderRadius? borderRadius,
    PlaceholderWidgetBuilder? placeHolder,
  }) {
    return AuvImageNet.network(
      url: url,
      width: width,
      height: height,
      fit: fit,
      clip: clip,
      borderRadius: borderRadius,
      placeHolder: placeHolder,
    );
  }

  /// 加载网络原图
  /// [url] 图片URL地址
  /// [width] 图片宽度
  /// [height] 图片高度
  /// [fit] :BoxFit.cover,
  /// [borderRadius] 圆角半径
  /// [placeHolder] 加载占位图
  static Widget orign({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius,
    PlaceholderWidgetBuilder? placeHolder,
  }) {
    return AuvImageNet.orign(
      url: url,
      width: width,
      height: height,
      fit: fit,
      borderRadius: borderRadius,
      placeHolder: placeHolder,
    );
  }

  /// 加载大尺寸网络图片
  /// [url] 图片URL地址
  /// [width] 图片宽度
  /// [height] 图片高度
  /// [fit] 图片填充模式
  /// [borderRadius] 圆角半径
  /// [placeHolder] 加载占位图
  /// [ignorePlaceHolder] 是否忽略占位图
  static Widget large({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius,
    PlaceholderWidgetBuilder? placeHolder,
    bool ignorePlaceHolder = false,
  }) {
    return AuvImageNet.large(
      url: url,
      width: width,
      height: height,
      fit: fit,
      borderRadius: borderRadius,
      placeHolder: placeHolder,
      ignorePlaceHolder: ignorePlaceHolder,
    );
  }

  /// 加载中等尺寸网络图片
  /// [url] 图片URL地址
  /// [width] 图片宽度
  /// [height] 图片高度
  /// [fit] 图片填充模式
  /// [placeHolder] 加载占位图
  /// [borderRadius] 圆角半径
  static Widget middle({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    PlaceholderWidgetBuilder? placeHolder,
    BorderRadius? borderRadius,
  }) {
    return AuvImageNet.middle(
      url: url,
      width: width,
      height: height,
      fit: fit,
      placeHolder: placeHolder,
      borderRadius: borderRadius,
    );
  }

  /// 加载小尺寸网络图片
  /// [url] 图片URL地址
  /// [width] 图片宽度
  /// [height] 图片高度
  /// [fit] 图片填充模式
  /// [placeHolder] 加载占位图
  /// [borderRadius] 圆角半径
  static Widget small({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius,
    PlaceholderWidgetBuilder? placeHolder,
  }) {
    return AuvImageNet.small(
      url: url,
      width: width,
      height: height,
      fit: fit,
      placeHolder: placeHolder,
      borderRadius: borderRadius,
    );
  }

  /// 加载圆形网络图片
  /// [url] 图片URL地址
  /// [size] 图片尺寸(宽高相同)
  /// [fit] 图片填充模式
  /// [clip] 图片裁剪类型
  /// [placeHolder] 加载占位图
  static Widget circle({
    required String url,
    required double size,
    BoxFit? fit,
    ImageClipType? clip,
    PlaceholderWidgetBuilder? placeHolder,
  }) {
    return AuvImageNet.circle(
      url: url,
      size: size,
      fit: fit,
      clip: clip,
      placeHolder: placeHolder,
    );
  }

  /// 加载圆角网络图片
  /// [url] 图片URL地址
  /// [clip] 图片裁剪类型
  /// [width] 图片宽度
  /// [height] 图片高度
  /// [fit] 图片填充模式
  /// [borderRadius] 圆角半径
  /// [placeHolder] 加载占位图
  /// [ignorePlaceHolder] 是否忽略占位图
  static Widget round({
    required String url,
    ImageClipType? clip,
    double? width,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius,
    PlaceholderWidgetBuilder? placeHolder,
    bool ignorePlaceHolder = false,
  }) {
    return AuvImageNet.round(
      url: url,
      clip: clip,
      width: width,
      height: height,
      fit: fit,
      borderRadius: borderRadius,
      placeHolder: placeHolder,
      ignorePlaceHolder: ignorePlaceHolder,
    );
  }

  ///是否网络图片
  static bool isNetworkImage(String imagePath) {
    return (imagePath.startsWith("http://") ||
        imagePath.startsWith("https://"));
  }

  ///是否本地图片
  static bool isFile(String imagePath) {
    return (imagePath.startsWith("file://"));
  }

  /// 当url是网络图片时，使用网络图片加载器，否则使用本地图片加载器
  /// [url] 图片URL地址
  /// [clip] 图片裁剪类型
  /// [width] 图片宽度
  /// [height] 图片高度
  /// [fit] 图片填充模式
  /// [borderRadius] 圆角半径
  /// [placeHolder] 加载占位图
  /// [ignorePlaceHolder] 是否忽略占位图
  static Widget complex({
    required String url,
    ImageClipType? clip,
    double? width,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius,
    PlaceholderWidgetBuilder? placeHolder,
    bool ignorePlaceHolder = false,
  }) {
    if (isNetworkImage(url)) {
      return AuvImageNet.orign(
          url: url,
          width: width,
          height: height,
          fit: fit,
          borderRadius: borderRadius,
          placeHolder: placeHolder);
    }
    if (isFile(url)) {
      return AuvImageLocal.file(
          fileName: url, width: width, height: height, fit: fit);
    } else {
      return AuvImageLocal.local(
          fileName: url,
          width: width,
          height: height,
          fit: fit,
          color: null,
          ext: null);
    }
  }

  /// 当url是网络图片时，使用网络图片加载器，否则使用本地图片加载器
  /// [url] 图片名称,可以是网络图片地址，也可以是本地图片路径、资源文件名
  static ImageProvider complexProvider(String url) {
    if (isNetworkImage(url)) {
      return AuvImageNet.provider(url);
    } else if (isFile(url)) {
      return AuvImageLocal.fileProvider(url);
    } else {
      return AuvImageLocal.assetProvider(url);
    }
  }
}
