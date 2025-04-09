import 'dart:io';

import 'package:flutter/material.dart';

/// 图片组件
class AuvImageLocal {
  /// 加载本地图片
  ///  [fileName] 图片名称
  ///  [width]
  ///  [height]
  ///  [fit] :图片填充方式，默认BoxFit.fill
  ///  [color] :图片颜色
  ///  [ext] :图片格式，默认png
  static Widget local(
      {required String fileName,
      double? width,
      double? height,
      BoxFit? fit,
      Color? color,
      String? ext}) {
    return Image(
        image: assetProvider(fileName, ext: ext),
        fit: fit,
        width: width,
        height: height,
        color: color);
  }

  /// 加载本地图片
  ///  [fileName] 图片名称
  ///  [ext] :图片格式，默认png
  static ImageProvider assetProvider(String fileName, {String? ext}) {
    return AssetImage("assets/images/$fileName.${ext ?? 'png'}");
  }

  /// 加载文件图片
  /// required [fileName]
  static Widget file(
      {required String fileName, double? width, double? height, BoxFit? fit}) {
    return Image(
        image: fileProvider(fileName), width: width, height: height, fit: fit);
  }

  /// 加载文件图片
  /// required [fileName]
  static ImageProvider fileProvider(String fileName) {
    return FileImage(File(fileName));
  }
}
