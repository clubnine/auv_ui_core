import 'dart:ui';

import 'package:flutter/material.dart';
import 'auv_text_styles.dart';

/// AuvText - 基于AuvTextStyles的通用文本组件
///
/// 使用示例:
/// ```dart
/// // 基础用法
/// AuvText('Hello World')
///   .style(AuvTextStyles.title1_B)
///   .build()
///
/// // 链式调用
/// AuvText('Hello World')
///   .title1()
///   .bold()
///   .color(Colors.blue)
///   .build()
///
/// // 预设样式
/// AuvText.title1('Hello World').build()
/// AuvText.body('Hello World').build()
/// ```
class AuvText {
  /// 文本内容
  final String _text;

  /// 文本样式
  TextStyle? _style;

  /// 文本对齐方式
  TextAlign? _textAlign;

  /// 文本方向
  TextDirection? _textDirection;

  /// 文本溢出处理方式
  TextOverflow? _overflow;

  /// 最大行数
  int? _maxLines;

  /// 是否自动换行
  bool? _softWrap;

  /// 文本缩放因子
  double? _textScaleFactor;

  /// 文本宽度计算基准
  TextWidthBasis? _textWidthBasis;

  /// 文本高度行为
  TextHeightBehavior? _textHeightBehavior;

  /// 语义标签
  String? _semanticsLabel;

  /// 区域设置
  Locale? _locale;

  /// 文本选择器
  TextSelectionThemeData? _selectionTheme;

  /// 构造函数
  AuvText(this._text);

  /// 预设样式 - 标题1
  factory AuvText.title1(String text) {
    return AuvText(text).style(AuvTextStyles.title1_B);
  }

  /// 预设样式 - 标题2
  factory AuvText.title2(String text) {
    return AuvText(text).style(AuvTextStyles.title2_B);
  }

  /// 预设样式 - 标题3
  factory AuvText.title3(String text) {
    return AuvText(text).style(AuvTextStyles.title3_B);
  }

  /// 预设样式 - 副标题
  factory AuvText.subtitle(String text) {
    return AuvText(text).style(AuvTextStyles.subtitle_B);
  }

  /// 预设样式 - 正文
  factory AuvText.body(String text) {
    return AuvText(text).style(AuvTextStyles.body_B);
  }

  /// 预设样式 - 正文2
  factory AuvText.body2(String text) {
    return AuvText(text).style(AuvTextStyles.body2_B);
  }

  /// 预设样式 - 说明文字
  factory AuvText.caption(String text) {
    return AuvText(text).style(AuvTextStyles.caption_B);
  }

  /// 预设样式 - 说明文字2
  factory AuvText.caption2(String text) {
    return AuvText(text).style(AuvTextStyles.caption2_B);
  }

  /// 设置文本样式
  AuvText style(TextStyle style) {
    _style = style;
    return this;
  }

  /// 设置文本颜色
  AuvText color(Color color) {
    _style = _style?.copyWith(color: color) ?? TextStyle(color: color);
    return this;
  }

  /// 设置文本大小
  AuvText size(double fontSize) {
    _style = _style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize);
    return this;
  }

  /// 设置文本粗细
  AuvText weight(FontWeight weight) {
    _style = _style?.copyWith(fontWeight: weight) ?? TextStyle(fontWeight: weight);
    return this;
  }

  /// 设置粗体
  AuvText bold() {
    return weight(FontWeight.bold);
  }

  /// 设置中等粗细
  AuvText medium() {
    return weight(FontWeight.w500);
  }

  /// 设置常规粗细
  AuvText regular() {
    return weight(FontWeight.normal);
  }

  /// 设置文本对齐方式
  AuvText align(TextAlign align) {
    _textAlign = align;
    return this;
  }

  /// 设置左对齐
  AuvText left() {
    return align(TextAlign.left);
  }

  /// 设置居中对齐
  AuvText center() {
    return align(TextAlign.center);
  }

  /// 设置右对齐
  AuvText right() {
    return align(TextAlign.right);
  }

  /// 设置文本方向
  AuvText direction(TextDirection direction) {
    _textDirection = direction;
    return this;
  }

  /// 设置文本溢出处理方式
  AuvText overflow(TextOverflow overflow) {
    _overflow = overflow;
    return this;
  }

  /// 设置省略号
  AuvText ellipsis() {
    return overflow(TextOverflow.ellipsis);
  }

  /// 设置截断
  AuvText clip() {
    return overflow(TextOverflow.clip);
  }

  /// 设置可见
  AuvText visible() {
    return overflow(TextOverflow.visible);
  }

  /// 设置最大行数
  AuvText maxLines(int maxLines) {
    _maxLines = maxLines;
    return this;
  }

  /// 设置单行
  AuvText singleLine() {
    return maxLines(1);
  }

  /// 设置是否自动换行
  AuvText softWrap(bool softWrap) {
    _softWrap = softWrap;
    return this;
  }

  /// 设置文本缩放因子
  AuvText scale(double textScaleFactor) {
    _textScaleFactor = textScaleFactor;
    return this;
  }

  /// 设置文本宽度计算基准
  AuvText widthBasis(TextWidthBasis textWidthBasis) {
    _textWidthBasis = textWidthBasis;
    return this;
  }

  /// 设置文本高度行为
  AuvText heightBehavior(TextHeightBehavior textHeightBehavior) {
    _textHeightBehavior = textHeightBehavior;
    return this;
  }

  /// 设置语义标签
  AuvText semantics(String semanticsLabel) {
    _semanticsLabel = semanticsLabel;
    return this;
  }

  /// 设置区域设置
  AuvText locale(Locale locale) {
    _locale = locale;
    return this;
  }

  /// 设置文本选择主题
  AuvText selectionTheme(TextSelectionThemeData selectionTheme) {
    _selectionTheme = selectionTheme;
    return this;
  }

  /// 设置标题1样式
  AuvText title1() {
    _style = AuvTextStyles.title1_B;
    return this;
  }

  /// 设置标题2样式
  AuvText title2() {
    _style = AuvTextStyles.title2_B;
    return this;
  }

  /// 设置标题3样式
  AuvText title3() {
    _style = AuvTextStyles.title3_B;
    return this;
  }

  /// 设置副标题样式
  AuvText subtitle() {
    _style = AuvTextStyles.subtitle_B;
    return this;
  }

  /// 设置正文样式
  AuvText body() {
    _style = AuvTextStyles.body_B;
    return this;
  }

  /// 设置正文2样式
  AuvText body2() {
    _style = AuvTextStyles.body2_B;
    return this;
  }

  /// 设置说明文字样式
  AuvText caption() {
    _style = AuvTextStyles.caption_B;
    return this;
  }

  /// 设置说明文字2样式
  AuvText caption2() {
    _style = AuvTextStyles.caption2_B;
    return this;
  }

  /// 设置透明度
  AuvText opacity(double opacity) {
    if (_style != null) {
      _style = _style!.copyWith(color: _style!.color?.withOpacity(opacity));
    }
    return this;
  }

  /// 设置下划线
  AuvText underline({Color? color, TextDecorationStyle? style, double? thickness}) {
    _style = _style?.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: color,
          decorationStyle: style,
          decorationThickness: thickness,
        ) ??
        TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: color,
          decorationStyle: style,
          decorationThickness: thickness,
        );
    return this;
  }

  /// 设置删除线
  AuvText strikethrough({Color? color, TextDecorationStyle? style, double? thickness}) {
    _style = _style?.copyWith(
          decoration: TextDecoration.lineThrough,
          decorationColor: color,
          decorationStyle: style,
          decorationThickness: thickness,
        ) ??
        TextStyle(
          decoration: TextDecoration.lineThrough,
          decorationColor: color,
          decorationStyle: style,
          decorationThickness: thickness,
        );
    return this;
  }

  /// 设置字间距
  AuvText letterSpacing(double letterSpacing) {
    _style = _style?.copyWith(letterSpacing: letterSpacing) ?? TextStyle(letterSpacing: letterSpacing);
    return this;
  }

  /// 设置行高
  AuvText height(double height) {
    _style = _style?.copyWith(height: height) ?? TextStyle(height: height);
    return this;
  }

  /// 设置字体
  AuvText fontFamily(String fontFamily) {
    _style = _style?.copyWith(fontFamily: fontFamily) ?? TextStyle(fontFamily: fontFamily);
    return this;
  }

  /// 设置字体样式
  AuvText fontStyle(FontStyle fontStyle) {
    _style = _style?.copyWith(fontStyle: fontStyle) ?? TextStyle(fontStyle: fontStyle);
    return this;
  }

  /// 设置斜体
  AuvText italic() {
    return fontStyle(FontStyle.italic);
  }

  /// 构建最终的Text widget
  Text build() {
    return Text(
      _text,
      style: _style,
      textAlign: _textAlign,
      textDirection: _textDirection,
      overflow: _overflow,
      maxLines: _maxLines,
      softWrap: _softWrap,
      textScaleFactor: _textScaleFactor,
      textWidthBasis: _textWidthBasis,
      textHeightBehavior: _textHeightBehavior,
      semanticsLabel: _semanticsLabel,
      locale: _locale,
      selectionColor: _selectionTheme?.selectionColor,
    );
  }
}
