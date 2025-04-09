import 'package:auv_core/auv_ui_core/auv_img_text.dart';
import 'package:auv_core/auv_ui_core/auv_widget_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮构造工具类，采用构建者模式创建按钮
///
/// 使用示例：
/// 1. 基础按钮：
///    AppButton()
///      .child(Text('提交'))
///      .onPressed(() {})
///      .build()
///
/// 2. 带背景图片按钮：
///    AppButton()
///      .child(Text('背景按钮'))
///      .onPressed(() {})
///      .backgroundImage(NetworkImage('url'))
///      .build()
///
/// 3. 自定义样式按钮：
///    AppButton()
///      .child(Text('警告'))
///      .onPressed(() {})
///      .type(AuvWidgetType.warning)
///      .size(AuvWidgetSize.large)
///      .shape(AuvWidgetShape.radius)
///      .radius(8)
///      .build()
///
/// 4. 禁用状态按钮：
///    AppButton()
///      .child(Text('禁用'))
///      .onPressed(() {})
///      .disabled(true)
///      .build()
///
/// 注意：child和onPressed是必填参数，必须在调用build()前设置
class AuvButton {
  // 颜色常量
  static const Color _primaryColor = Color(0xFF409EFF);
  static const Color _successColor = Color(0xFF67C23A);
  static const Color _warningColor = Color(0xFFE6A23C);
  static const Color _dangerColor = Color(0xFFF56C6C);
  static const Color _infoColor = Color(0xFF909399);
  static const Color _secondaryColor = Color(0xFFF2F6FC);

  // 构建属性
  VoidCallback? _onPressed;
  AuvWidgetType _type = AuvWidgetType.primary;
  AuvWidgetSize _size = AuvWidgetSize.middle;
  AuvWidgetShape _shape = AuvWidgetShape.radius;
  double? _width;
  double? _height;
  double _radius = 4;
  bool _disabled = false;
  Color? _borderColor;
  Color? _backgroundColor;
  Color? _textColor;
  Color? _disabledColor;
  Color? _disabledTextColor;
  List<BoxShadow>? _shadow;

  AuvButton();

  // 链式调用方法
  AuvButton onPressed(VoidCallback onPressed) {
    _onPressed = onPressed;
    return this;
  }

  AuvButton type(AuvWidgetType type) {
    _type = type;
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

  AuvButton middle() {
    _size = AuvWidgetSize.middle;
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

  AuvButton disabled(bool disabled) {
    _disabled = disabled;
    return this;
  }

  AuvButton borderColor(Color color) {
    _borderColor = color;
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
    return build(
        AuvImgText().size(_size).textStyle(textStyle).build(imagePath, text));
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
        AuvWidgetSize.middle => 18.sp,
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

  Widget build(Widget child) {
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) => _getEffectiveBgColor(states),
      ),
      padding: MaterialStateProperty.all(_getPadding()),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: _getBorderRadius(),
          side: _borderColor != null
              ? BorderSide(color: _borderColor!)
              : BorderSide.none,
        ),
      ),
      minimumSize: MaterialStateProperty.all(
        Size(_width ?? 0, _height ?? _getDefaultHeight()),
      ),
      elevation: MaterialStateProperty.all(_shadow != null ? 4 : 0),
      shadowColor: MaterialStateProperty.all(
        _shadow?.first.color ?? Colors.transparent,
      ),
    );

    return ElevatedButton(
      style: buttonStyle,
      onPressed: _disabled ? null : _onPressed,
      child: child,
    );
  }

  EdgeInsets _getPadding() {
    switch (_size) {
      case AuvWidgetSize.micro:
        return EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w);
      case AuvWidgetSize.tiny:
        return EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.w);
      case AuvWidgetSize.mini:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w);
      case AuvWidgetSize.small:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w);
      case AuvWidgetSize.middle:
        return EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w);
      case AuvWidgetSize.large:
        return EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w);
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
      case AuvWidgetSize.middle:
        return 36;
      case AuvWidgetSize.large:
        return 40;
    }
  }
}
