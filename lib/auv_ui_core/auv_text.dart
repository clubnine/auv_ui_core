import 'dart:ui';

import 'package:flutter/material.dart';

/// 文本构建工具类（构建者模式）
/// 提供链式API来配置文本样式和布局属性
///
/// 使用示例：
/// ```
/// AuvText('Hello World')
///   .style(TextStyle(fontSize: 16))
///   .textAlign(TextAlign.right)
///   .maxLines(1)
///   .build()
///
/// AuvText.h1('Hello World')
/// ```
class AuvText {
  /// 文本内容
  final String _text;

  /// 文本样式
  TextStyle? _style;

  /// 文本对齐方式
  TextAlign? _textAlign;

  /// 文本方向(LTR/RTL)
  TextDirection? _textDirection;

  /// 区域设置
  Locale? _locale;

  /// 是否自动换行
  bool? _softWrap;

  /// 溢出处理方式
  TextOverflow? _overflow;

  /// 最大行数
  int? _maxLines;

  /// 语义标签
  String? _semanticsLabel;

  /// 文本宽度计算基准
  TextWidthBasis? _textWidthBasis;

  /// 文本高度行为
  TextHeightBehavior? _textHeightBehavior;

  /// 构造函数
  /// [text] 要显示的文本内容
  AuvText(this._text);

  /// 设置文本样式
  AuvText style(TextStyle style) {
    _style = style;
    return this;
  }

  /// 设置文本对齐方式
  AuvText textAlign(TextAlign align) {
    _textAlign = align;
    return this;
  }

  AuvText textDirection(TextDirection direction) {
    _textDirection = direction;
    return this;
  }

  AuvText locale(Locale locale) {
    _locale = locale;
    return this;
  }

  AuvText softWrap(bool softWrap) {
    _softWrap = softWrap;
    return this;
  }

  AuvText overflow(TextOverflow overflow) {
    _overflow = overflow;
    return this;
  }

  AuvText maxLines(int maxLines) {
    _maxLines = maxLines;
    return this;
  }

  AuvText semanticsLabel(String label) {
    _semanticsLabel = label;
    return this;
  }

  AuvText textWidthBasis(TextWidthBasis basis) {
    _textWidthBasis = basis;
    return this;
  }

  AuvText textHeightBehavior(TextHeightBehavior behavior) {
    _textHeightBehavior = behavior;
    return this;
  }

  /// 构建最终的Text widget
  Text build() {
    return Text(
      _text,
      style: _style,
      textAlign: _textAlign,
      textDirection: _textDirection,
      locale: _locale,
      softWrap: _softWrap,
      overflow: _overflow,
      maxLines: _maxLines,
      semanticsLabel: _semanticsLabel,
      textWidthBasis: _textWidthBasis,
      textHeightBehavior: _textHeightBehavior,
    );
  }
}
