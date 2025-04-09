import 'package:flutter/material.dart';

/// 应用字体样式系统
/// 基于Material Design 3规范
class AuvTextStyle {
  // ========== 颜色定义 ==========
  static const Color primaryTextColor = Color(0xFF333333); // 主要文字颜色
  static const Color secondaryTextColor = Color(0xFF666666); // 次要文字颜色
  static const Color placeholderColor = Color(0xFF999999); // 占位文字颜色
  static const Color primaryColor = Color(0xFF409EFF); // 主色
  static const Color dangerColor = Color(0xFFF56C6C); // 危险色

  // ========== 显示文本 ==========
  static TextStyle get displayLarge => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: primaryTextColor,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
      );

  static TextStyle get displaySmall => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
      );

  // ========== 标题文本 ==========
  static TextStyle get headlineLarge => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
      );

  static TextStyle get headlineMedium => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
      );

  static TextStyle get headlineSmall => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
      );

  // ========== 标题文本 ==========
  static TextStyle get titleLarge => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: primaryTextColor,
      );

  static TextStyle get titleSmall => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: primaryTextColor,
      );

  // ========== 正文文本 ==========
  static TextStyle get bodyLarge => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: primaryTextColor,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: primaryTextColor,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: primaryTextColor,
      );

  // ========== 标签文本 ==========
  static TextStyle get labelLarge => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: primaryTextColor,
      );

  static TextStyle get labelMedium => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: primaryTextColor,
      );

  static TextStyle get labelSmall => const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: primaryTextColor,
      );

  // ========== 特殊状态 ==========
  static TextStyle get disabled => bodyMedium.copyWith(
        color: placeholderColor,
      );

  static TextStyle get link => bodyMedium.copyWith(
        color: primaryColor,
        decoration: TextDecoration.underline,
      );

  static TextStyle get error => bodyMedium.copyWith(
        color: dangerColor,
      );

  // ========== 工具方法 ==========
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withOpacity(TextStyle style, double opacity) {
    return style.copyWith(color: style.color?.withOpacity(opacity));
  }
}
