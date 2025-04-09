import 'package:auv_core/auv_ui_core/auv_dimens.dart';
import 'package:auv_core/auv_ui_core/auv_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 卡片构建工具类（构建者模式）
///
/// 提供了一套完整的卡片构建API，支持：
/// - 全局/轴向/单边间距设置
/// - 圆角半径配置
/// - 阴影效果控制
/// - 边框样式定制
/// - 点击交互效果
///
/// 使用示例：
/// ```
/// AppBox()
///   .p8()    // 8pt全局内边距
///   .mh16()  // 水平16pt外边距
///   .r12()   // 12pt圆角
///   .build(Text('内容'))
/// ```
class AuvBox {
  // ========== 基础属性 ==========
  EdgeInsetsGeometry? _padding;
  EdgeInsetsGeometry? _margin;
  Color? _color;
  Color? _shadowColor;
  double _elevation = 0.0;
  double _borderRadius = 0.0;
  Border? _border;

  /// 背景装饰效果
  Decoration? _decoration;

  // ... 已有方法保持不变 ...

  /// 设置背景装饰效果
  AuvBox decoration(Decoration decoration) {
    _decoration = decoration;
    return this;
  }

  // ========== 基础设置方法 ==========
  /// 设置内边距
  AuvBox padding(EdgeInsets padding) {
    _padding = padding;
    return this;
  }

  /// 设置外边距
  AuvBox margin(EdgeInsets margin) {
    _margin = margin;
    return this;
  }

  // ========== 基础设置方法 ==========
  /// 设置背景颜色
  AuvBox color(Color color) {
    _color = color;
    return this;
  }

  /// 设置圆角半径
  AuvBox borderRadius(double borderRadius) {
    _borderRadius = borderRadius;
    return this;
  }

  /// 设置边框样式
  AuvBox border(Border border) {
    _border = border;
    return this;
  }

  /// 设置阴影高度
  AuvBox elevation(double elevation) {
    _elevation = elevation;
    return this;
  }

  /// 设置阴影颜色
  AuvBox shadowColor(Color shadowColor) {
    _shadowColor = shadowColor;
    return this;
  }

  // ========== 全局间距快捷方法 ==========

  /// 2pt全局内边距
  AuvBox p2() {
    _padding = AuvSpace.s2;
    return this;
  }

  /// 4pt全局内边距
  AuvBox p4() {
    _padding = AuvSpace.s4;
    return this;
  }

  /// 8pt全局内边距
  AuvBox p8() {
    _padding = AuvSpace.s8;
    return this;
  }

  /// 12pt全局内边距
  AuvBox p12() {
    _padding = AuvSpace.s12;
    return this;
  }

  /// 16pt全局内边距
  AuvBox p16() {
    _padding = AuvSpace.s16;
    return this;
  }

  /// 20pt全局内边距
  AuvBox p20() {
    _padding = AuvSpace.s20;
    return this;
  }

  /// 24pt全局内边距
  AuvBox p24() {
    _padding = AuvSpace.s24;
    return this;
  }

  /// 32pt全局内边距
  AuvBox p32() {
    _padding = AuvSpace.s32;
    return this;
  }

  /// 40pt全局内边距
  AuvBox p40() {
    _padding = AuvSpace.s40;
    return this;
  }

  /// 使用AuvSpace.s28设置内边距
  AuvBox p28() {
    _padding = AuvSpace.s28;
    return this;
  }

  /// 使用AuvSpace.s2设置外边距
  AuvBox m2() {
    _margin = AuvSpace.s2;
    return this;
  }

  /// 使用AuvSpace.s4设置外边距
  AuvBox m4() {
    _margin = AuvSpace.s4;
    return this;
  }

  /// 使用AuvSpace.s8设置外边距
  AuvBox m8() {
    _margin = AuvSpace.s8;
    return this;
  }

  /// 使用AuvSpace.s12设置外边距
  AuvBox m12() {
    _margin = AuvSpace.s12;
    return this;
  }

  /// 使用AuvSpace.s16设置外边距
  AuvBox m16() {
    _margin = AuvSpace.s16;
    return this;
  }

  /// 使用AuvSpace.s20设置外边距
  AuvBox m20() {
    _margin = AuvSpace.s20;
    return this;
  }

  /// 使用AuvSpace.s24设置外边距
  AuvBox m24() {
    _margin = AuvSpace.s24;
    return this;
  }

  /// 使用AuvSpace.s28设置外边距
  AuvBox m28() {
    _margin = AuvSpace.s28;
    return this;
  }

  /// 使用AuvSpace.s32设置外边距
  AuvBox m32() {
    _margin = AuvSpace.s32;
    return this;
  }

  /// 使用AuvSpace.s40设置外边距
  AuvBox m40() {
    _margin = AuvSpace.s40;
    return this;
  }

  /// 使用AuvDimens.d2设置圆角半径
  AuvBox r2() {
    _borderRadius = AuvDimens.d2;
    return this;
  }

  /// 使用AuvDimens.d4设置圆角半径
  AuvBox r4() {
    _borderRadius = AuvDimens.d4;
    return this;
  }

  /// 使用AuvDimens.d8设置圆角半径
  AuvBox r8() {
    _borderRadius = AuvDimens.d8;
    return this;
  }

  /// 使用AuvDimens.d12设置圆角半径
  AuvBox r12() {
    _borderRadius = AuvDimens.d12;
    return this;
  }

  /// 使用AuvDimens.d16设置圆角半径
  AuvBox r16() {
    _borderRadius = AuvDimens.d16;
    return this;
  }

  /// 使用AuvDimens.d20设置圆角半径
  AuvBox r20() {
    _borderRadius = AuvDimens.d20;
    return this;
  }

  /// 使用AuvDimens.d24设置圆角半径
  AuvBox r24() {
    _borderRadius = AuvDimens.d24;
    return this;
  }

  /// 使用AuvDimens.d28设置圆角半径
  AuvBox r28() {
    _borderRadius = AuvDimens.d28;
    return this;
  }

  /// 使用AuvDimens.d32设置圆角半径
  AuvBox r32() {
    _borderRadius = AuvDimens.d32;
    return this;
  }

  /// 使用AuvDimens.d40设置圆角半径
  AuvBox r40() {
    _borderRadius = AuvDimens.d40;
    return this;
  }

  /// 设置为左右圆形圆角
  AuvBox circle() {
    _borderRadius = 100.w;
    return this;
  }

  /// 构建卡片Widget
  Widget build(Widget child) {
    final decoration = _decoration is BoxDecoration
        ? (_decoration as BoxDecoration).copyWith(
            color: _color,
            borderRadius: BorderRadius.circular(_borderRadius),
            border: _border,
            boxShadow: _elevation > 0
                ? [
                    BoxShadow(
                      color: _shadowColor ?? Colors.black.withOpacity(0.1),
                      blurRadius: _elevation * 2,
                      spreadRadius: _elevation * 0.5,
                      offset: Offset(0, _elevation),
                    )
                  ]
                : null,
          )
        : BoxDecoration(
            color: _color ?? Colors.transparent,
            borderRadius: BorderRadius.circular(_borderRadius),
            border: _border,
            boxShadow: _elevation > 0
                ? [
                    BoxShadow(
                      color: _shadowColor ?? Colors.black.withOpacity(0.1),
                      blurRadius: _elevation * 2,
                      spreadRadius: _elevation * 0.5,
                      offset: Offset(0, _elevation),
                    )
                  ]
                : null,
          );

    return Container(
      margin: _margin,
      padding: _padding,
      clipBehavior: Clip.hardEdge,
      decoration: decoration,
      child: child,
    );
  }

  // ========== 轴向间距快捷方法 ==========
  /// 水平2pt内边距
  AuvBox ph2() {
    _padding = EdgeInsets.symmetric(horizontal: AuvDimens.d2);
    return this;
  }

  /// 水平4pt内边距
  AuvBox ph4() {
    _padding = EdgeInsets.symmetric(horizontal: AuvDimens.d4);
    return this;
  }

  /// 水平8pt内边距
  AuvBox ph8() {
    _padding = EdgeInsets.symmetric(horizontal: AuvDimens.d8);
    return this;
  }

  /// 水平12pt内边距
  AuvBox ph12() {
    _padding = EdgeInsets.symmetric(horizontal: AuvDimens.d12);
    return this;
  }

  /// 水平16pt内边距
  AuvBox ph16() {
    _padding = EdgeInsets.symmetric(horizontal: AuvDimens.d16);
    return this;
  }

  /// 水平20pt内边距
  AuvBox ph20() {
    _padding = EdgeInsets.symmetric(horizontal: AuvDimens.d20);
    return this;
  }

  /// 水平24pt内边距
  AuvBox ph24() {
    _padding = EdgeInsets.symmetric(horizontal: AuvDimens.d24);
    return this;
  }

  /// 垂直2pt内边距
  AuvBox pv2() {
    _padding = EdgeInsets.symmetric(vertical: AuvDimens.d2);
    return this;
  }

  /// 垂直4pt内边距
  AuvBox pv4() {
    _padding = EdgeInsets.symmetric(vertical: AuvDimens.d4);
    return this;
  }

  /// 垂直8pt内边距
  AuvBox pv8() {
    _padding = EdgeInsets.symmetric(vertical: AuvDimens.d8);
    return this;
  }

  /// 垂直12pt内边距
  AuvBox pv12() {
    _padding = EdgeInsets.symmetric(vertical: AuvDimens.d12);
    return this;
  }

  /// 垂直16pt内边距
  AuvBox pv16() {
    _padding = EdgeInsets.symmetric(vertical: AuvDimens.d16);
    return this;
  }

  /// 垂直20pt内边距
  AuvBox pv20() {
    _padding = EdgeInsets.symmetric(vertical: AuvDimens.d20);
    return this;
  }

  /// 垂直24pt内边距
  AuvBox pv24() {
    _padding = EdgeInsets.symmetric(vertical: AuvDimens.d24);
    return this;
  }

  // ========== 单边内边距快捷方法 ==========
  /// 顶部2pt内边距
  AuvBox pt2() {
    _padding = EdgeInsets.only(top: AuvDimens.d2);
    return this;
  }

  /// 顶部4pt内边距
  AuvBox pt4() {
    _padding = EdgeInsets.only(top: AuvDimens.d4);
    return this;
  }

  /// 顶部8pt内边距
  AuvBox pt8() {
    _padding = EdgeInsets.only(top: AuvDimens.d8);
    return this;
  }

  /// 顶部12pt内边距
  AuvBox pt12() {
    _padding = EdgeInsets.only(top: AuvDimens.d12);
    return this;
  }

  /// 顶部16pt内边距
  AuvBox pt16() {
    _padding = EdgeInsets.only(top: AuvDimens.d16);
    return this;
  }

  /// 底部2pt内边距
  AuvBox pb2() {
    _padding = EdgeInsets.only(bottom: AuvDimens.d2);
    return this;
  }

  /// 底部4pt内边距
  AuvBox pb4() {
    _padding = EdgeInsets.only(bottom: AuvDimens.d4);
    return this;
  }

  /// 底部8pt内边距
  AuvBox pb8() {
    _padding = EdgeInsets.only(bottom: AuvDimens.d8);
    return this;
  }

  /// 底部12pt内边距
  AuvBox pb12() {
    _padding = EdgeInsets.only(bottom: AuvDimens.d12);
    return this;
  }

  /// 底部16pt内边距
  AuvBox pb16() {
    _padding = EdgeInsets.only(bottom: AuvDimens.d16);
    return this;
  }

  /// 起始边2pt内边距(支持RTL)
  AuvBox ps2() {
    _padding = EdgeInsetsDirectional.only(start: AuvDimens.d2);
    return this;
  }

  /// 起始边4pt内边距(支持RTL)
  AuvBox ps4() {
    _padding = EdgeInsetsDirectional.only(start: AuvDimens.d4);
    return this;
  }

  /// 起始边8pt内边距(支持RTL)
  AuvBox ps8() {
    _padding = EdgeInsetsDirectional.only(start: AuvDimens.d8);
    return this;
  }

  /// 起始边12pt内边距(支持RTL)
  AuvBox ps12() {
    _padding = EdgeInsetsDirectional.only(start: AuvDimens.d12);
    return this;
  }

  /// 起始边16pt内边距(支持RTL)
  AuvBox ps16() {
    _padding = EdgeInsetsDirectional.only(start: AuvDimens.d16);
    return this;
  }

  /// 结束边2pt内边距(支持RTL)
  AuvBox pe2() {
    _padding = EdgeInsetsDirectional.only(end: AuvDimens.d2);
    return this;
  }

  /// 结束边4pt内边距(支持RTL)
  AuvBox pe4() {
    _padding = EdgeInsetsDirectional.only(end: AuvDimens.d4);
    return this;
  }

  /// 结束边8pt内边距(支持RTL)
  AuvBox pe8() {
    _padding = EdgeInsetsDirectional.only(end: AuvDimens.d8);
    return this;
  }

  /// 结束边12pt内边距(支持RTL)
  AuvBox pe12() {
    _padding = EdgeInsetsDirectional.only(end: AuvDimens.d12);
    return this;
  }

  /// 结束边16pt内边距(支持RTL)
  AuvBox pe16() {
    _padding = EdgeInsetsDirectional.only(end: AuvDimens.d16);
    return this;
  }

  // ========== 轴向外边距快捷方法 ==========
  /// 水平2pt外边距
  AuvBox mh2() {
    _margin = EdgeInsets.symmetric(horizontal: AuvDimens.d2);
    return this;
  }

  /// 水平4pt外边距
  AuvBox mh4() {
    _margin = EdgeInsets.symmetric(horizontal: AuvDimens.d4);
    return this;
  }

  /// 水平8pt外边距
  AuvBox mh8() {
    _margin = EdgeInsets.symmetric(horizontal: AuvDimens.d8);
    return this;
  }

  /// 水平12pt外边距
  AuvBox mh12() {
    _margin = EdgeInsets.symmetric(horizontal: AuvDimens.d12);
    return this;
  }

  /// 水平16pt外边距
  AuvBox mh16() {
    _margin = EdgeInsets.symmetric(horizontal: AuvDimens.d16);
    return this;
  }

  /// 水平20pt外边距
  AuvBox mh20() {
    _margin = EdgeInsets.symmetric(horizontal: AuvDimens.d20);
    return this;
  }

  /// 水平24pt外边距
  AuvBox mh24() {
    _margin = EdgeInsets.symmetric(horizontal: AuvDimens.d24);
    return this;
  }

  /// 垂直2pt外边距
  AuvBox mv2() {
    _margin = EdgeInsets.symmetric(vertical: AuvDimens.d2);
    return this;
  }

  /// 垂直4pt外边距
  AuvBox mv4() {
    _margin = EdgeInsets.symmetric(vertical: AuvDimens.d4);
    return this;
  }

  /// 垂直8pt外边距
  AuvBox mv8() {
    _margin = EdgeInsets.symmetric(vertical: AuvDimens.d8);
    return this;
  }

  /// 垂直12pt外边距
  AuvBox mv12() {
    _margin = EdgeInsets.symmetric(vertical: AuvDimens.d12);
    return this;
  }

  /// 垂直16pt外边距
  AuvBox mv16() {
    _margin = EdgeInsets.symmetric(vertical: AuvDimens.d16);
    return this;
  }

  /// 垂直20pt外边距
  AuvBox mv20() {
    _margin = EdgeInsets.symmetric(vertical: AuvDimens.d20);
    return this;
  }

  /// 垂直24pt外边距
  AuvBox mv24() {
    _margin = EdgeInsets.symmetric(vertical: AuvDimens.d24);
    return this;
  }

  // ========== 单边外边距快捷方法 ==========
  /// 顶部2pt外边距
  AuvBox mt2() {
    _margin = EdgeInsets.only(top: AuvDimens.d2);
    return this;
  }

  /// 顶部4pt外边距
  AuvBox mt4() {
    _margin = EdgeInsets.only(top: AuvDimens.d4);
    return this;
  }

  /// 顶部8pt外边距
  AuvBox mt8() {
    _margin = EdgeInsets.only(top: AuvDimens.d8);
    return this;
  }

  /// 顶部12pt外边距
  AuvBox mt12() {
    _margin = EdgeInsets.only(top: AuvDimens.d12);
    return this;
  }

  /// 顶部16pt外边距
  AuvBox mt16() {
    _margin = EdgeInsets.only(top: AuvDimens.d16);
    return this;
  }

  /// 底部2pt外边距
  AuvBox mb2() {
    _margin = EdgeInsets.only(bottom: AuvDimens.d2);
    return this;
  }

  /// 底部4pt外边距
  AuvBox mb4() {
    _margin = EdgeInsets.only(bottom: AuvDimens.d4);
    return this;
  }

  /// 底部8pt外边距
  AuvBox mb8() {
    _margin = EdgeInsets.only(bottom: AuvDimens.d8);
    return this;
  }

  /// 底部12pt外边距
  AuvBox mb12() {
    _margin = EdgeInsets.only(bottom: AuvDimens.d12);
    return this;
  }

  /// 底部16pt外边距
  AuvBox mb16() {
    _margin = EdgeInsets.only(bottom: AuvDimens.d16);
    return this;
  }

  /// 起始边2pt外边距(支持RTL)
  AuvBox ms2() {
    _margin = EdgeInsetsDirectional.only(start: AuvDimens.d2);
    return this;
  }

  /// 起始边4pt外边距(支持RTL)
  AuvBox ms4() {
    _margin = EdgeInsetsDirectional.only(start: AuvDimens.d4);
    return this;
  }

  /// 起始边8pt外边距(支持RTL)
  AuvBox ms8() {
    _margin = EdgeInsetsDirectional.only(start: AuvDimens.d8);
    return this;
  }

  /// 起始边12pt外边距(支持RTL)
  AuvBox ms12() {
    _margin = EdgeInsetsDirectional.only(start: AuvDimens.d12);
    return this;
  }

  /// 起始边16pt外边距(支持RTL)
  AuvBox ms16() {
    _margin = EdgeInsetsDirectional.only(start: AuvDimens.d16);
    return this;
  }

  /// 结束边2pt外边距(支持RTL)
  AuvBox me2() {
    _margin = EdgeInsetsDirectional.only(end: AuvDimens.d2);
    return this;
  }

  /// 结束边4pt外边距(支持RTL)
  AuvBox me4() {
    _margin = EdgeInsetsDirectional.only(end: AuvDimens.d4);
    return this;
  }

  /// 结束边8pt外边距(支持RTL)
  AuvBox me8() {
    _margin = EdgeInsetsDirectional.only(end: AuvDimens.d8);
    return this;
  }

  /// 结束边12pt外边距(支持RTL)
  AuvBox me12() {
    _margin = EdgeInsetsDirectional.only(end: AuvDimens.d12);
    return this;
  }

  /// 结束边16pt外边距(支持RTL)
  AuvBox me16() {
    _margin = EdgeInsetsDirectional.only(end: AuvDimens.d16);
    return this;
  }
}
