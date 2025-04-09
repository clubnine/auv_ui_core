import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:auv_core/auv_ui_core/auv_image_local.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 生成图片加载器
/// [url] - 图片URL
/// [length] - 最长边尺寸，默认0表示原图
/// [clip] - 裁剪类型，默认原图
/// 图片加载工具类，提供网络图片加载、缓存、裁剪、水印等功能
class AuvImageNet {
  /// 单例实例
  static AuvImageNet get instance => _instance;
  static final AuvImageNet _instance = AuvImageNet();

  /// 默认配置：小图60px，中图150px，大图600px，质量95%，水印应用名"auv"
  static AuvImageLoaderConfig _config =
      AuvImageLoaderConfig(60, 150, 600, 95, "auv");

  /// 默认头像背景颜色列表
  static List<Color> AUV_DEFAULT_AVATAR_BG_COLORS = [
    Colors.black54,
    Colors.pink.withAlpha(200),
    Colors.blue.withAlpha(200),
    Colors.red.withAlpha(200),
    Colors.green.withAlpha(200),
    Colors.grey.withAlpha(200),
    Colors.brown.withAlpha(200),
    Colors.yellow.withAlpha(200),
    Colors.purple.withAlpha(200),
    Colors.amber.withAlpha(200)
  ];

  /// 初始化图片加载配置
  static void init(AuvImageLoaderConfig config) {
    _config = config;
  }

  /// 生成图片加载器
  /// [url] - 图片URL
  /// [length] - 最长边尺寸，默认0表示原图
  /// [clip] - 裁剪类型，默认原图
  static ImageProvider provider(String url,
      {int length = 0, ImageClipType clip = ImageClipType.custom}) {
    return CachedNetworkImageProvider(
        instance._url(url, length: length, clip: clip));
  }

  /// 加载网络图片（带默认处理）
  /// [url] - 图片URL
  /// [fit] - 图片填充模式，默认cover
  /// [height] - 图片高度，默认无限
  /// [width] - 图片宽度，默认无限
  /// [borderRadius] - 圆角半径，默认无
  /// [boxShape] - 形状，默认矩形
  /// [clip] - 裁剪类型，默认原图
  /// [length] - 最长边尺寸，默认0表示原图
  /// [placeholder] - 占位widget构建器
  /// [errorWidget] - 错误widget构建器
  static CachedNetworkImage image(
    String url, {
    BoxFit? fit = BoxFit.cover,
    double? height = double.infinity,
    double? width = double.infinity,
    BorderRadiusGeometry? borderRadius = BorderRadius.zero,
    BoxShape boxShape = BoxShape.rectangle,
    ImageClipType clip = ImageClipType.origin,
    int length = 0,
    PlaceholderWidgetBuilder? placeholder,
    LoadingErrorWidgetBuilder? errorWidget,
  }) {
    return instance._image(url,
        fit: fit,
        height: height,
        width: width,
        borderRadius: borderRadius,
        boxShape: boxShape,
        clip: clip,
        length: length,
        placeholder: placeholder,
        errorWidget: errorWidget);
  }

  CachedNetworkImage _image(
    String url, {
    BoxFit? fit = BoxFit.cover,
    double? height = double.infinity,
    double? width = double.infinity,
    BorderRadiusGeometry? borderRadius = BorderRadius.zero,
    BoxShape boxShape = BoxShape.rectangle,
    ImageClipType clip = ImageClipType.origin,
    int length = 0,
    PlaceholderWidgetBuilder? placeholder,
    LoadingErrorWidgetBuilder? errorWidget,
  }) {
    fit ??= BoxFit.cover;
    String cover = url;
    String fileName = cover.substring(cover.lastIndexOf('/') + 1);
    //是否默认头像: http://image.amiya001.com/10000 ... 19999
    bool isDefaultAvatar = false;

    if (fileName.length <= 10) {
      //手工上传的图片
      cover = _auvUrlOrigin(url);
      //
      int? val = int.tryParse(fileName);
      if (val != null && val >= 10000 && val <= 20000) {
        isDefaultAvatar = true;
      }
    } else {
      //七牛标准命名图片
      cover = _url(url, length: length, clip: clip);
    }

    // logger.d("IMG:${width}x$height $clip $url");
    // logger.d("URL:$cover");

    return CachedNetworkImage(
      imageUrl: cover,
      height: height,
      width: width,
      fit: fit,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: boxShape == BoxShape.circle ? null : borderRadius,
              shape: boxShape,
              image: DecorationImage(image: imageProvider, fit: fit),
              color: isDefaultAvatar
                  ? AUV_DEFAULT_AVATAR_BG_COLORS[fileName.hashCode.abs() %
                      AUV_DEFAULT_AVATAR_BG_COLORS.length]
                  : null),
        );
      },
      placeholder: placeholder,
      errorWidget: errorWidget ??
          (context, url, error) {
            //有占位图则使用占位图，否则使用默认占位图
            return placeholder != null
                ? placeholder(context, url)
                : _defaultPlaceHolder(width, height, fit, borderRadius)(
                    context, url);
          },
    );
  }

  // static String VerticalLine =
  /// 不指定分辨率，原图打水印
  static String _auvUrlOrigin(String url) {
    //原图不加水印， 因为原图一般用在图标、默认头像等场景，加水印容易产生问题
    return url; //"$url${url.contains('?') ? '%7C' : '?%7C'}watermark/2/text/${_base64Encode(_config.appName)}/fontsize/200/fill/d2hpdGU=/dissolve/20";
  }

  /// 七牛处理图片url命令
  String _url(String url,
      {int length = 0, ImageClipType clip = ImageClipType.custom}) {
    Size size;
    if (length > 0 || clip == ImageClipType.origin) {
      size = Size(length.toDouble(), length.toDouble());
    } else {
      switch (clip) {
        case ImageClipType.small:
          size = Size(_config.small.toDouble(), _config.small.toDouble());
          break;
        case ImageClipType.middle:
          size = Size(_config.middle.toDouble(), _config.middle.toDouble());
          break;
        case ImageClipType.large:
          size = Size(_config.large.toDouble(), _config.large.toDouble());
          break;
        case ImageClipType.custom:
          size = const Size(0, 0);
        default:
          size = const Size(0, 0);
      }
    }

    if (!_shouldThumbnail(url)) return url;
    if (size.width == 0 && size.height == 0) {
      return _auvUrlOrigin(url);
    }

    String ret;
    size = _sizeWithScreenScale(size);
    //%7C ==> |
    ret = '$url${url.contains('?') ? '%7C' : '?'}imageView2/3';
    if (size.width > 0) ret += '/w/${size.width.toInt()}';
    if (size.height > 0) ret += '/h/${size.height.toInt()}';
    ret += '/quality/${_config.quality}/ignore-error/1';
    ret +=
        '%7Cwatermark/2/text/${_base64Encode(_config.appName)}/fontsize/200/fill/d2hpdGU=/dissolve/20';
    ret += '%7CimageMogr2/auto-orient';
    // 如原图是gif格式，直接转webp会出错，需将imageMogr2/format/webp的命令用管道重新拼在后面才可用
    if (Platform.isAndroid) ret += '/format/webp';

    return ret;
  }

  /// Base64编码
  static String _base64Encode(String data) {
    var bytes = utf8.encode(data);
    var base64Str = base64.encode(bytes);
    return base64Str;
  }

  /// 判断是否需要缩略图处理（仅处理http/https链接）
  bool _shouldThumbnail(String url) {
    return url.contains('http');
  }

  /// 根据屏幕缩放比例调整尺寸
  Size _sizeWithScreenScale(Size size) {
    return size * 2; // 使用 2 代替 window.devicePixelRatio;
  }

  // 加载网络图片时占位图，默认为CircularProgressIndicator
  static final PlaceholderWidgetBuilder placeHolderLoader = ((context, url) =>
      const CircularProgressIndicator(color: Color(0xFFFFFFFF)));

  /// 加载网络图片
  /// required [url]
  /// [width] :double.infinity
  /// [height] :double.infinity
  /// [fit] :BoxFit.cover, 如果没有传递，那么会自动根据width和height来判断是否需要裁切
  /// [clip] :ImageClipType.custom
  static Widget network(
      {required String url,
      double? width,
      double? height,
      BoxFit? fit,
      ImageClipType? clip,
      BorderRadius? borderRadius,
      PlaceholderWidgetBuilder? placeHolder}) {
    //没有传递时,自动判断裁切参数
    clip = clip ?? _autoThumbSize(width, height, ImageClipType.custom);

    placeHolder ??= _defaultPlaceHolder(width, height, fit, borderRadius);

    return AuvImageNet.image(url,
        width: width,
        height: height,
        fit: fit,
        placeholder: placeHolder,
        borderRadius: borderRadius);
  }

  ///加载原图, 不会裁切
  ///[url]
  ///[width]
  ///[height]
  ///[fit]
  ///[borderRadius]
  ///[placeHolder]
  ///[ignorePlaceHolder] 是否忽略占位图，默认false
  static Widget orign(
      {required String url,
      double? width,
      double? height,
      BoxFit? fit,
      BorderRadius? borderRadius,
      PlaceholderWidgetBuilder? placeHolder}) {
    placeHolder ??= _defaultPlaceHolder(width, height, fit, borderRadius);

    return AuvImageNet.image(url,
        width: width,
        height: height,
        placeholder: placeHolder,
        borderRadius: borderRadius);
  }

  static PlaceholderWidgetBuilder _defaultPlaceHolder(double? width,
      double? height, BoxFit? fit, BorderRadiusGeometry? borderRadius) {
    return ((context, url) {
      if (borderRadius != null) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: AuvImageLocal.local(
              fileName: "auv_res_image_loader_default",
              width: width,
              height: height,
              fit: fit),
        );
      }
      return AuvImageLocal.local(
          fileName: "auv_res_image_loader_default",
          width: width,
          height: height,
          fit: fit);
    });
  }

  static Widget large(
      {required String url,
      double? width,
      double? height,
      BoxFit? fit = BoxFit.cover,
      BorderRadius? borderRadius,
      PlaceholderWidgetBuilder? placeHolder,
      bool ignorePlaceHolder = false}) {
    if (placeHolder == null && !ignorePlaceHolder) {
      placeHolder ??= _defaultPlaceHolder(width, height, fit, borderRadius);
    }

    return AuvImageNet.image(url,
        width: width,
        height: height,
        fit: fit,
        clip: ImageClipType.large,
        placeholder: placeHolder,
        borderRadius: borderRadius);
  }

  static Widget middle(
      {required String url,
      double? width,
      double? height,
      BoxFit? fit = BoxFit.cover,
      PlaceholderWidgetBuilder? placeHolder,
      BorderRadius? borderRadius}) {
    placeHolder ??= _defaultPlaceHolder(width, height, fit, borderRadius);

    return AuvImageNet.image(url,
        width: width,
        height: height,
        fit: fit,
        clip: ImageClipType.middle,
        placeholder: placeHolder,
        borderRadius: borderRadius);
  }

  static Widget small(
      {required String url,
      double? width,
      double? height,
      BoxFit? fit = BoxFit.cover,
      PlaceholderWidgetBuilder? placeHolder,
      BorderRadius? borderRadius}) {
    placeHolder ??= _defaultPlaceHolder(width, height, fit, borderRadius);

    return AuvImageNet.image(url,
        width: width,
        height: height,
        fit: fit,
        clip: ImageClipType.small,
        placeholder: placeHolder,
        borderRadius: borderRadius);
  }

  /// 加载网络图片，裁剪圆形
  /// required [url]
  static Widget circle(
      {required String url,
      required double size,
      BoxFit? fit = BoxFit.cover,
      ImageClipType? clip,
      PlaceholderWidgetBuilder? placeHolder}) {
    clip ??= _autoThumbSize(size, size, ImageClipType.small);
    placeHolder ??=
        _defaultPlaceHolder(size, size, fit, BorderRadius.circular(size / 2));

    return AuvImageNet.image(url,
        width: size,
        height: size,
        fit: fit,
        boxShape: BoxShape.circle,
        clip: clip,
        placeholder: placeHolder);
  }

  /// 加载网络图片，裁剪圆角
  /// required [url]
  /// [borderRadius] :BorderRadius.zero
  static Widget round(
      {required String url,
      ImageClipType? clip,
      double? width,
      double? height,
      BoxFit? fit = BoxFit.cover,
      BorderRadius? borderRadius,
      PlaceholderWidgetBuilder? placeHolder,
      bool ignorePlaceHolder = false}) {
    clip ??= _autoThumbSize(width, height, ImageClipType.small);

    if (placeHolder == null && !ignorePlaceHolder) {
      placeHolder = _defaultPlaceHolder(width, height, fit, borderRadius);
    }

    return AuvImageNet.image(url,
        width: width,
        height: height,
        fit: fit,
        borderRadius: borderRadius, // 确保borderRadius参数被传递
        clip: clip,
        placeholder: placeHolder);
  }

  static ImageClipType _autoThumbSize(
      double? width, double? height, ImageClipType def) {
    if (width == null && height == null) {
      return def;
    }

    double size;
    if (width != null && height != null) {
      size = max(width, height);
    } else if (width != null) {
      size = width;
    } else {
      size = height!;
    }

    if (size < _config.small) {
      return ImageClipType.small;
    }

    if (size < _config.middle) {
      return ImageClipType.middle;
    }

    if (size < _config.large) {
      return ImageClipType.large;
    }

    return def;
  }
}

/// 图片裁剪类型枚举
enum ImageClipType {
  /// 自定义尺寸
  custom,

  /// 小图
  small,

  /// 中图
  middle,

  /// 大图
  large,

  /// 原图
  origin,
}

/// 图片加载配置类
class AuvImageLoaderConfig {
  /// 小图尺寸
  final int small;

  /// 中图尺寸
  final int middle;

  /// 大图尺寸
  final int large;

  /// 图片质量(0-100)
  final int quality;

  /// 水印应用名
  final String appName;

  AuvImageLoaderConfig(
      this.small, this.middle, this.large, this.quality, this.appName);
}
