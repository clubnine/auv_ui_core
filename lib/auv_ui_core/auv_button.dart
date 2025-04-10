import 'package:auv_ui_core/auv_ui_core/auv_colors.dart';
import 'package:auv_ui_core/auv_ui_core/auv_dimens.dart';
import 'package:auv_ui_core/auv_ui_core/auv_img_text.dart';
import 'package:auv_ui_core/auv_ui_core/auv_widget_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮构造工具类，采用构建者模式创建按钮
///
class AuvButton {
  // 颜色常量
  static const Color _primaryColor = AuvColors.primary;

  ///
  static const Color _successColor = Color(0xFF67C23A);
  static const Color _warningColor = Color(0xFFE6A23C);
  static const Color _dangerColor = Color(0xFFF56C6C);
  static const Color _infoColor = Color(0xFF909399);
  static const Color _secondaryColor = Color(0xFFF2F6FC);

  // 构建属性
  VoidCallback? _click;
  AuvWidgetType _type = AuvWidgetType.primary;
  AuvWidgetSize _size = AuvWidgetSize.medium;
  AuvWidgetShape _shape = AuvWidgetShape.radius;
  double? _width;
  double? _height;
  double _radius = 4;
  bool _disabled = false;
  Color? _borderColor;
  double? _borderWidth;
  Color? _backgroundColor;
  Color? _textColor;
  Color? _disabledColor;
  Color? _disabledTextColor;
  List<BoxShadow>? _shadow;

  /// 背景装饰效果，可替代backgroundColor实现更复杂的背景
  Decoration? _decoration;
  EdgeInsets? _margin;

  AuvButton();

  // 链式调用方法
  AuvButton click(VoidCallback click) {
    _click = click;
    return this;
  }

  AuvButton margin(EdgeInsets margin) {
    _margin = margin;
    return this;
  }

  AuvButton m2() {
    _margin = EdgeInsets.all(2.w);
    return this;
  }

  AuvButton m4() {
    _margin = EdgeInsets.all(4.w);
    return this;
  }

  AuvButton m6() {
    _margin = EdgeInsets.all(6.w);
    return this;
  }

  AuvButton m8() {
    _margin = EdgeInsets.all(8.w);
    return this;
  }

  AuvButton m10() {
    _margin = EdgeInsets.all(10.w);
    return this;
  }

  AuvButton m12() {
    _margin = EdgeInsets.all(12.w);
    return this;
  }

  AuvButton m16() {
    _margin = EdgeInsets.all(16.w);
    return this;
  }

  AuvButton m20() {
    _margin = EdgeInsets.all(20.w);
    return this;
  }

  AuvButton m24() {
    _margin = EdgeInsets.all(24.w);
    return this;
  }

  AuvButton m32() {
    _margin = EdgeInsets.all(32.w);
    return this;
  }

  AuvButton type(AuvWidgetType type) {
    _type = type;
    return this;
  }

  AuvButton primary() {
    _type = AuvWidgetType.primary;
    return this;
  }

  AuvButton secondary() {
    _type = AuvWidgetType.secondary;
    return this;
  }

  AuvButton success() {
    _type = AuvWidgetType.success;
    return this;
  }

  AuvButton warning() {
    _type = AuvWidgetType.warning;
    return this;
  }

  AuvButton danger() {
    _type = AuvWidgetType.danger;
    return this;
  }

  AuvButton info() {
    _type = AuvWidgetType.info;
    return this;
  }

  AuvButton size(AuvWidgetSize size) {
    _size = size;
    return this;
  }

  AuvButton micro() {
    _size = AuvWidgetSize.micro;
    return this;
  }

  AuvButton tiny() {
    _size = AuvWidgetSize.tiny;
    return this;
  }

  AuvButton mini() {
    _size = AuvWidgetSize.mini;
    return this;
  }

  AuvButton small() {
    _size = AuvWidgetSize.small;
    return this;
  }

  AuvButton medium() {
    _size = AuvWidgetSize.medium;
    return this;
  }

  AuvButton large() {
    _size = AuvWidgetSize.large;
    return this;
  }

  AuvButton circle() {
    _shape = AuvWidgetShape.circle;
    return this;
  }

  AuvButton width(double width) {
    _width = width;
    return this;
  }

  AuvButton height(double height) {
    _height = height;
    return this;
  }

  AuvButton radius(double radius) {
    _shape = AuvWidgetShape.radius;
    _radius = radius;
    return this;
  }

  AuvButton r2() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d2;
    return this;
  }

  AuvButton r4() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d4;
    return this;
  }

  AuvButton r8() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d8;
    return this;
  }

  AuvButton r12() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d12;
    return this;
  }

  AuvButton r16() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d16;
    return this;
  }

  AuvButton r20() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d20;
    return this;
  }

  AuvButton r24() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d24;
    return this;
  }

  AuvButton r32() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d32;
    return this;
  }

  AuvButton r40() {
    _shape = AuvWidgetShape.radius;
    _radius = AuvDimens.d40;
    return this;
  }

  AuvButton disabled(bool disabled) {
    _disabled = disabled;
    return this;
  }

  AuvButton border(Color color, {double width = 1}) {
    _borderColor = color;
    _borderWidth = width;
    return this;
  }

  AuvButton backgroundColor(Color color) {
    _backgroundColor = color;
    return this;
  }

  AuvButton textColor(Color color) {
    _textColor = color;
    return this;
  }

  AuvButton disabledColor(Color color) {
    _disabledColor = color;
    return this;
  }

  AuvButton disabledTextColor(Color color) {
    _disabledTextColor = color;
    return this;
  }

  AuvButton shadow(List<BoxShadow> shadow) {
    _shadow = shadow;
    return this;
  }

  ///文本和图片按钮
  ///[imagePath] 图片路径
  ///[text] 文本内容
  Widget imgText(String imagePath, String text) {
    TextStyle textStyle = _getTextStyle();
    return build(AuvImgText().size(_size).textStyle(textStyle).build(imagePath, text));
  }

  TextStyle _getTextStyle() {
    Color color = _textColor ?? _getTextColor();
    if (_disabled) {
      color = _disabledTextColor ?? color.withOpacity(0.5);
    }
    TextStyle textStyle = TextStyle(
      color: color,
      fontSize: switch (_size) {
        AuvWidgetSize.micro => 10.sp,
        AuvWidgetSize.tiny => 12.sp,
        AuvWidgetSize.mini => 14.sp,
        AuvWidgetSize.small => 16.sp,
        AuvWidgetSize.medium => 18.sp,
        AuvWidgetSize.large => 20.sp,
      },
      fontWeight: FontWeight.w500,
    );
    return textStyle;
  }

  ///文本按钮
  ///[text] 文本内容
  Widget text(String text) {
    TextStyle textStyle = _getTextStyle();

    return build(Text(
      text,
      style: textStyle,
    ));
  }

  /// 设置背景装饰效果
  AuvButton decoration(Decoration decoration) {
    _decoration = decoration;
    return this;
  }

  Widget build(Widget child) {
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) => _getEffectiveBgColor(states),
      ),
      padding: MaterialStateProperty.all(_getPadding()),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: _getBorderRadius(),
          side: _borderColor != null ? BorderSide(color: _borderColor!, width: _borderWidth!) : BorderSide.none,
        ),
      ),
      fixedSize: MaterialStateProperty.all(
        Size(_width ?? 0, _height ?? _getDefaultHeight()),
      ),
      minimumSize: MaterialStateProperty.all(
        Size(_width ?? 0, _height ?? _getDefaultHeight()),
      ),
      elevation: MaterialStateProperty.all(_shadow != null ? 4 : 0),
      shadowColor: MaterialStateProperty.all(
        _shadow?.first.color ?? Colors.transparent,
      ),
    );

    if (_decoration != null || _margin != null || _width != null || _height != null) {
      return Container(
        margin: _margin,
        width: _width,
        height: _height ?? _getDefaultHeight(),
        decoration: _decoration, // 应用装饰效果
        alignment: Alignment.center,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: _disabled ? null : _click,
          child: child,
        ),
      );
    } else {
      return ElevatedButton(
        style: buttonStyle,
        onPressed: _disabled ? null : _click,
        child: child,
      );
    }
  }

  EdgeInsets _getPadding() {
    switch (_size) {
      case AuvWidgetSize.micro:
        return EdgeInsets.symmetric(horizontal: _width != null ? 0 : 8.w, vertical: _height != null ? 0 : 2.w);
      case AuvWidgetSize.tiny:
        return EdgeInsets.symmetric(horizontal: _width != null ? 0 : 10.w, vertical: _height != null ? 0 : 3.w);
      case AuvWidgetSize.mini:
        return EdgeInsets.symmetric(horizontal: _width != null ? 0 : 12.w, vertical: _height != null ? 0 : 4.w);
      case AuvWidgetSize.small:
        return EdgeInsets.symmetric(horizontal: _width != null ? 0 : 16.w, vertical: _height != null ? 0 : 6.w);
      case AuvWidgetSize.medium:
        return EdgeInsets.symmetric(horizontal: _width != null ? 0 : 20.w, vertical: _height != null ? 0 : 8.w);
      case AuvWidgetSize.large:
        return EdgeInsets.symmetric(horizontal: _width != null ? 0 : 24.w, vertical: _height != null ? 0 : 10.w);
    }
  }

  BorderRadius _getBorderRadius() {
    switch (_shape) {
      case AuvWidgetShape.circle:
        return BorderRadius.circular(100);
      case AuvWidgetShape.radius:
        return BorderRadius.circular(_radius ?? 4);
    }
  }

  Color _getButtonColor() {
    switch (_type) {
      case AuvWidgetType.primary:
        return _primaryColor;
      case AuvWidgetType.secondary:
        return _secondaryColor;
      case AuvWidgetType.success:
        return _successColor;
      case AuvWidgetType.warning:
        return _warningColor;
      case AuvWidgetType.danger:
        return _dangerColor;
      case AuvWidgetType.info:
        return _infoColor;
    }
  }

  Color _getTextColor() {
    switch (_type) {
      case AuvWidgetType.primary:
        return Colors.white;
      case AuvWidgetType.secondary:
        return _primaryColor;
      case AuvWidgetType.success:
        return Colors.white;
      case AuvWidgetType.warning:
        return Colors.white;
      case AuvWidgetType.danger:
        return Colors.white;
      case AuvWidgetType.info:
        return Colors.white;
    }
  }

  Color _getEffectiveBgColor(Set<MaterialState> states) {
    if (_decoration != null) {
      return Colors.transparent;
    }

    if (states.contains(MaterialState.disabled)) {
      return _disabledColor ?? _getButtonColor().withOpacity(0.5);
    }
    return _backgroundColor ?? _getButtonColor();
  }

  double _getDefaultHeight() {
    switch (_size) {
      case AuvWidgetSize.micro:
        return 20;
      case AuvWidgetSize.tiny:
        return 24;
      case AuvWidgetSize.mini:
        return 28;
      case AuvWidgetSize.small:
        return 32;
      case AuvWidgetSize.medium:
        return 36;
      case AuvWidgetSize.large:
        return 40;
    }
  }
}
