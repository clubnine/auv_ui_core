import 'package:auv_core/auv_ui_core/auv_image.dart';
import 'package:auv_core/auv_ui_core/auv_image_local.dart';
import 'package:auv_core/auv_ui_core/auv_image_net.dart';
import 'package:auv_core/auv_ui_core/auv_widget_enums.dart';
import 'package:flutter/material.dart';

/// 图片文字组合组件
///
/// 布局类型示例:
///
/// 水平布局(默认):
/// ┌───────────────┐
/// │ 🖼️ 文字内容   │
/// └───────────────┘
///
/// 水平反向布局:
/// ┌───────────────┐
/// │ 文字内容 🖼️   │
/// └───────────────┘
///
/// 垂直布局:
/// ┌───────────────┐
/// │      🖼️       │
/// │     文字内容   │
/// └───────────────┘
///
/// 垂直反向布局:
/// ┌───────────────┐
/// │     文字内容   │
/// │      🖼️       │
/// └───────────────┘
///
/// 尺寸示例:
/// mini:   [🖼️文]
/// small:  [🖼️ 文字]
/// middle: [🖼️ 文字内容]
/// large:  [🖼️ 更多文字内容]
///
/// 交互状态:
/// 点击效果: [🖼️ 文字内容] → 按下状态
enum AuvImgTextLayout {
  horizontal, // 图片在左，文字在右
  horizontalReverse, // 图片在右，文字在左
  vertical, // 图片在上，文字在下
  verticalReverse, // 图片在下，文字在上
}

/// 图片文字组合的布局类型枚举
/// 图片文字组合组件 - 链式调用构建器
///
/// [══════════ 使用示例 ══════════]
///
/// 1. 基础水平布局：
///    ┌─────────────────┐
///    │ 🖼️ 点击登录     │ ← 默认样式
///    └─────────────────┘
///    AuvImgText()
///     .size(AuvWidgetSize.middle)
///     .build(AssetImage('icon.png'), '点击登录')
///
/// 2. 垂直布局带圆角：
///    ┌─────────────────┐
///    │       🖼️        │
///    │    立即购买      │ ← 垂直居中+圆角
///    └─────────────────┘
///    AuvImgText()
///     .layout(AuvImgTextLayout.vertical)
///     .borderRadius(BorderRadius.circular(8))
///     .build(NetworkImage('icon.png'), '立即购买')
///
/// 3. 小型禁用按钮：
///    ┌─────────────┐
///    │ 🖼️ 已售罄    │ ← 灰色禁用状态
///    └─────────────┘
///    AuvImgText()
///     .size(AuvWidgetSize.small)
///     .backgroundColor(Colors.grey[200])
///     .build(AssetImage('icon.png'), '已售罄')
///
/// [══════════ 布局类型 ══════════]
///
/// 水平布局(默认): [🖼️ 文字内容]
/// 水平反向布局: [文字内容 🖼️]
/// 垂直布局:
///    ┌─────┐
///    │ 🖼️ │
///    │ 文字 │
///    └─────┘
/// 垂直反向布局:
///    ┌─────┐
///    │ 文字 │
///    │ 🖼️ │
///    └─────┘
///
/// [══════════ 尺寸规格 ══════════]
///
/// micro: 超小 [🖼️]
/// tiny:  特小 [🖼️文]
/// mini:  迷你 [🖼️ 文]
/// small: 小号 [🖼️ 文字]
/// middle:中号 [🖼️ 文字内容]
/// large: 大号 [🖼️ 更多文字内容]
class AuvImgText {
  /// 图片显示尺寸（单位：像素）
  /// 如果为null则根据size自动计算
  double? _imageSize;

  /// 图片与文字之间的间距（单位：像素）
  /// 如果为null则根据size自动计算
  double? _spacing;

  /// 内边距设置
  /// 如果为null则根据size自动计算
  EdgeInsetsGeometry? _padding;

  /// 外边距设置，默认为0
  EdgeInsetsGeometry? _margin;

  /// 背景颜色，默认为透明
  Color? _backgroundColor;

  /// 背景装饰效果
  Decoration? _decoration;

  /// 圆角边框设置
  /// 如果为null则根据size自动计算默认圆角
  BorderRadiusGeometry? _borderRadius;

  /// 文本样式
  /// 如果为null则使用默认文本样式
  TextStyle? _textStyle;

  /// 布局方式，默认为水平布局（图片左文字右）
  AuvWidgetSize _size = AuvWidgetSize.middle;

  /// 组件尺寸枚举，控制整体大小
  AuvImgTextLayout _layout = AuvImgTextLayout.horizontal;

  AuvImgText();

  AuvImgText size(AuvWidgetSize size) {
    _size = size;
    return this;
  }

  AuvImgText micro() {
    return size(AuvWidgetSize.micro);
  }

  AuvImgText tiny() {
    return size(AuvWidgetSize.tiny);
  }

  AuvImgText mini() {
    return size(AuvWidgetSize.mini);
  }

  AuvImgText small() {
    return size(AuvWidgetSize.small);
  }

  AuvImgText middle() {
    return size(AuvWidgetSize.middle);
  }

  AuvImgText large() {
    return size(AuvWidgetSize.large);
  }

  AuvImgText layout(AuvImgTextLayout layout) {
    _layout = layout;
    return this;
  }

  AuvImgText horizontal() {
    return layout(AuvImgTextLayout.horizontal);
  }

  AuvImgText horizontalReverse() {
    return layout(AuvImgTextLayout.horizontalReverse);
  }

  AuvImgText vertical() {
    return layout(AuvImgTextLayout.vertical);
  }

  AuvImgText verticalReverse() {
    return layout(AuvImgTextLayout.verticalReverse);
  }

  AuvImgText padding(EdgeInsetsGeometry padding) {
    _padding = padding;
    return this;
  }

  AuvImgText margin(EdgeInsetsGeometry margin) {
    _margin = margin;
    return this;
  }

  AuvImgText decoration(Decoration decoration) {
    _decoration = decoration;
    return this;
  }

  AuvImgText spacing(double spacing) {
    _spacing = spacing;
    return this;
  }

  AuvImgText backgroundColor(Color color) {
    _backgroundColor = color;
    return this;
  }

  AuvImgText textStyle(TextStyle textStyle) {
    _textStyle = textStyle;
    return this;
  }

  AuvImgText imageSize(double imageSize) {
    _imageSize = imageSize;
    return this;
  }

  AuvImgText borderRadius(BorderRadiusGeometry borderRadius) {
    _borderRadius = borderRadius;
    return this;
  }

  // 修改_getImageSize方法
  double _getImageSize() {
    return _imageSize ??
        switch (_size) {
          AuvWidgetSize.micro => 8,
          AuvWidgetSize.tiny => 12,
          AuvWidgetSize.mini => 16,
          AuvWidgetSize.small => 24,
          AuvWidgetSize.middle => 32,
          AuvWidgetSize.large => 40,
        };
  }

  // 修改_getSpacing方法
  double _getSpacing() {
    return _spacing ??
        switch (_size) {
          AuvWidgetSize.micro => 2,
          AuvWidgetSize.tiny => 3,
          AuvWidgetSize.mini => 4,
          AuvWidgetSize.small => 8,
          AuvWidgetSize.middle => 12,
          AuvWidgetSize.large => 16,
        };
  }

  // 修改_getPadding方法
  EdgeInsets _getPadding() {
    if (_padding != null) {
      return _padding!.resolve(TextDirection.ltr);
    }
    return switch (_size) {
      AuvWidgetSize.micro => const EdgeInsets.all(3),
      AuvWidgetSize.tiny => const EdgeInsets.all(4),
      AuvWidgetSize.mini => const EdgeInsets.all(6),
      AuvWidgetSize.small => const EdgeInsets.all(8),
      AuvWidgetSize.middle => const EdgeInsets.all(12),
      AuvWidgetSize.large => const EdgeInsets.all(16),
    };
  }

  // 修改_getTextStyle方法
  TextStyle _getTextStyle() {
    final baseStyle = _textStyle ?? const TextStyle();
    return baseStyle.copyWith(
      fontSize: switch (_size) {
        AuvWidgetSize.micro => 8,
        AuvWidgetSize.tiny => 10,
        AuvWidgetSize.mini => 12,
        AuvWidgetSize.small => 14,
        AuvWidgetSize.middle => 16,
        AuvWidgetSize.large => 18,
      },
    );
  }

  // 添加获取默认圆角的方法
  BorderRadius _getDefaultBorderRadius() {
    return switch (_size) {
      AuvWidgetSize.micro => BorderRadius.circular(2),
      AuvWidgetSize.tiny => BorderRadius.circular(3),
      AuvWidgetSize.mini => BorderRadius.circular(4),
      AuvWidgetSize.small => BorderRadius.circular(6),
      AuvWidgetSize.middle => BorderRadius.circular(8),
      AuvWidgetSize.large => BorderRadius.circular(10),
    };
  }

  /// 构建方法
  /// imagePath: 图片路径，可以是网络路径或本地路径
  /// text: 显示的文字内容
  Widget build(String imagePath, String text) {
    return buildWithImageProvider(AuvImage.complexProvider(imagePath), text);
  }

  /// 边框颜色，默认为null(无边框)
  Color? _borderColor;

  /// 边框宽度，默认为1.0
  double _borderWidth = 1.0;

  /// 设置边框
  AuvImgText border({Color? color, double width = 1.0}) {
    _borderColor = color;
    _borderWidth = width;
    return this;
  }

  Widget buildWithImageProvider(ImageProvider image, String text) {
    if (_backgroundColor == null &&
        _decoration == null &&
        _margin == null &&
        _borderColor == null) {
      return _buildContent(image, text);
    }

    final borderRadius = _borderRadius ?? _getDefaultBorderRadius();
    BoxDecoration decoration;
    if (_decoration != null && _decoration is BoxDecoration) {
      decoration = (_decoration as BoxDecoration).copyWith(
        borderRadius: _decoration is BoxDecoration
            ? (_decoration as BoxDecoration).borderRadius ?? borderRadius
            : borderRadius,
        border: _borderColor != null
            ? Border.all(
                color: _borderColor!,
                width: _borderWidth,
              )
            : null,
      );
    } else {
      decoration = BoxDecoration(
        borderRadius: borderRadius,
        color: _backgroundColor,
        border: _borderColor != null
            ? Border.all(
                color: _borderColor!,
                width: _borderWidth,
              )
            : null,
      );
    }

    return Container(
      margin: _margin,
      child: Container(
        padding: _getPadding(),
        decoration: decoration,
        child: _buildContent(image, text),
      ),
    );
  }

  /// 构建内容区域的核心方法
  /// 根据layout参数决定图片和文字的排列方式
  /// context: 构建上下文
  /// 返回: 排列好的内容Widget
  Widget _buildContent(ImageProvider image, String text) {
    // 构建图片Widget，使用计算得到的尺寸
    final imageWidget = Image(
      image: image, // 修正为_image
      width: _getImageSize(),
      height: _getImageSize(),
      fit: BoxFit.contain,
    );

    // 构建文本Widget，使用计算得到的文本样式
    final textWidget = Text(text, style: _getTextStyle()); // 修正为_text

    // 获取计算后的间距值
    final currentSpacing = _getSpacing();

    // 根据布局类型返回不同的排列方式
    switch (_layout) {
      // 修正为_layout
      case AuvImgTextLayout.horizontal:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            imageWidget,
            SizedBox(width: currentSpacing),
            textWidget,
          ],
        );
      case AuvImgTextLayout.horizontalReverse:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            textWidget,
            SizedBox(width: currentSpacing),
            imageWidget,
          ],
        );
      case AuvImgTextLayout.vertical:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            imageWidget,
            SizedBox(height: currentSpacing),
            textWidget,
          ],
        );
      case AuvImgTextLayout.verticalReverse:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textWidget,
            SizedBox(height: currentSpacing),
            imageWidget,
          ],
        );
    }
  }
}
