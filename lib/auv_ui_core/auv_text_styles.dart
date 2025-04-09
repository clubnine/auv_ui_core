// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// TextStyle扩展方法
extension TextStyleExtension on TextStyle {
  /// 修改字体颜色
  TextStyle color(Color color) {
    return copyWith(color: color);
  }

  TextStyle size(double fontSize) {
    return copyWith(fontSize: fontSize);
  }
}

/// Roboto字体样式系统
/// 包含所有字号、字重和透明度的组合
class AuvTextStyles {
  // ========== 颜色定义 ==========
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // 内部构建方法
  static TextStyle _buildStyle(double fontSize, FontWeight fontWeight, Color color, double opacity) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color.withOpacity(opacity),
    );
  }

  // ========== 标题1 (24px) ==========
  static TextStyle get title1_B => _buildStyle(24, FontWeight.bold, black, 1.0);
  static TextStyle get title1_B_80 => _buildStyle(24, FontWeight.bold, black, 0.8);
  static TextStyle get title1_B_60 => _buildStyle(24, FontWeight.bold, black, 0.6);
  static TextStyle get title1_B_40 => _buildStyle(24, FontWeight.bold, black, 0.4);
  static TextStyle get title1_B_20 => _buildStyle(24, FontWeight.bold, black, 0.2);

  static TextStyle get title1_M => _buildStyle(24, FontWeight.w500, black, 1.0);
  static TextStyle get title1_M_80 => _buildStyle(24, FontWeight.w500, black, 0.8);
  static TextStyle get title1_M_60 => _buildStyle(24, FontWeight.w500, black, 0.6);
  static TextStyle get title1_M_40 => _buildStyle(24, FontWeight.w500, black, 0.4);
  static TextStyle get title1_M_20 => _buildStyle(24, FontWeight.w500, black, 0.2);

  static TextStyle get title1_R => _buildStyle(24, FontWeight.normal, black, 1.0);
  static TextStyle get title1_R_80 => _buildStyle(24, FontWeight.normal, black, 0.8);
  static TextStyle get title1_R_60 => _buildStyle(24, FontWeight.normal, black, 0.6);
  static TextStyle get title1_R_40 => _buildStyle(24, FontWeight.normal, black, 0.4);
  static TextStyle get title1_R_20 => _buildStyle(24, FontWeight.normal, black, 0.2);

  // ========== 标题2 (22px) ==========
  static TextStyle get title2_B => _buildStyle(22, FontWeight.bold, black, 1.0);
  static TextStyle get title2_B_80 => _buildStyle(22, FontWeight.bold, black, 0.8);
  static TextStyle get title2_B_60 => _buildStyle(22, FontWeight.bold, black, 0.6);
  static TextStyle get title2_B_40 => _buildStyle(22, FontWeight.bold, black, 0.4);
  static TextStyle get title2_B_20 => _buildStyle(22, FontWeight.bold, black, 0.2);

  static TextStyle get title2_M => _buildStyle(22, FontWeight.w500, black, 1.0);
  static TextStyle get title2_M_80 => _buildStyle(22, FontWeight.w500, black, 0.8);
  static TextStyle get title2_M_60 => _buildStyle(22, FontWeight.w500, black, 0.6);
  static TextStyle get title2_M_40 => _buildStyle(22, FontWeight.w500, black, 0.4);
  static TextStyle get title2_M_20 => _buildStyle(22, FontWeight.w500, black, 0.2);

  static TextStyle get title2_R => _buildStyle(22, FontWeight.normal, black, 1.0);
  static TextStyle get title2_R_80 => _buildStyle(22, FontWeight.normal, black, 0.8);
  static TextStyle get title2_R_60 => _buildStyle(22, FontWeight.normal, black, 0.6);
  static TextStyle get title2_R_40 => _buildStyle(22, FontWeight.normal, black, 0.4);
  static TextStyle get title2_R_20 => _buildStyle(22, FontWeight.normal, black, 0.2);

  // ========== 标题3 (20px) ==========
  static TextStyle get title3_B => _buildStyle(20, FontWeight.bold, black, 1.0);
  static TextStyle get title3_B_80 => _buildStyle(20, FontWeight.bold, black, 0.8);
  static TextStyle get title3_B_60 => _buildStyle(20, FontWeight.bold, black, 0.6);
  static TextStyle get title3_B_40 => _buildStyle(20, FontWeight.bold, black, 0.4);
  static TextStyle get title3_B_20 => _buildStyle(20, FontWeight.bold, black, 0.2);

  static TextStyle get title3_M => _buildStyle(20, FontWeight.w500, black, 1.0);
  static TextStyle get title3_M_80 => _buildStyle(20, FontWeight.w500, black, 0.8);
  static TextStyle get title3_M_60 => _buildStyle(20, FontWeight.w500, black, 0.6);
  static TextStyle get title3_M_40 => _buildStyle(20, FontWeight.w500, black, 0.4);
  static TextStyle get title3_M_20 => _buildStyle(20, FontWeight.w500, black, 0.2);

  static TextStyle get title3_R => _buildStyle(20, FontWeight.normal, black, 1.0);
  static TextStyle get title3_R_80 => _buildStyle(20, FontWeight.normal, black, 0.8);
  static TextStyle get title3_R_60 => _buildStyle(20, FontWeight.normal, black, 0.6);
  static TextStyle get title3_R_40 => _buildStyle(20, FontWeight.normal, black, 0.4);
  static TextStyle get title3_R_20 => _buildStyle(20, FontWeight.normal, black, 0.2);

  // ========== 副标题 (18px) ==========
  static TextStyle get subtitle_B => _buildStyle(18, FontWeight.bold, black, 1.0);
  static TextStyle get subtitle_B_80 => _buildStyle(18, FontWeight.bold, black, 0.8);
  static TextStyle get subtitle_B_60 => _buildStyle(18, FontWeight.bold, black, 0.6);
  static TextStyle get subtitle_B_40 => _buildStyle(18, FontWeight.bold, black, 0.4);
  static TextStyle get subtitle_B_20 => _buildStyle(18, FontWeight.bold, black, 0.2);

  static TextStyle get subtitle_M => _buildStyle(18, FontWeight.w500, black, 1.0);
  static TextStyle get subtitle_M_80 => _buildStyle(18, FontWeight.w500, black, 0.8);
  static TextStyle get subtitle_M_60 => _buildStyle(18, FontWeight.w500, black, 0.6);
  static TextStyle get subtitle_M_40 => _buildStyle(18, FontWeight.w500, black, 0.4);
  static TextStyle get subtitle_M_20 => _buildStyle(18, FontWeight.w500, black, 0.2);

  static TextStyle get subtitle_R => _buildStyle(18, FontWeight.normal, black, 1.0);
  static TextStyle get subtitle_R_80 => _buildStyle(18, FontWeight.normal, black, 0.8);
  static TextStyle get subtitle_R_60 => _buildStyle(18, FontWeight.normal, black, 0.6);
  static TextStyle get subtitle_R_40 => _buildStyle(18, FontWeight.normal, black, 0.4);
  static TextStyle get subtitle_R_20 => _buildStyle(18, FontWeight.normal, black, 0.2);

  // ========== 正文 (16px) ==========
  static TextStyle get body_B => _buildStyle(16, FontWeight.bold, black, 1.0);
  static TextStyle get body_B_80 => _buildStyle(16, FontWeight.bold, black, 0.8);
  static TextStyle get body_B_60 => _buildStyle(16, FontWeight.bold, black, 0.6);
  static TextStyle get body_B_40 => _buildStyle(16, FontWeight.bold, black, 0.4);
  static TextStyle get body_B_20 => _buildStyle(16, FontWeight.bold, black, 0.2);

  static TextStyle get body_M => _buildStyle(16, FontWeight.w500, black, 1.0);
  static TextStyle get body_M_80 => _buildStyle(16, FontWeight.w500, black, 0.8);
  static TextStyle get body_M_60 => _buildStyle(16, FontWeight.w500, black, 0.6);
  static TextStyle get body_M_40 => _buildStyle(16, FontWeight.w500, black, 0.4);
  static TextStyle get body_M_20 => _buildStyle(16, FontWeight.w500, black, 0.2);

  static TextStyle get body_R => _buildStyle(16, FontWeight.normal, black, 1.0);
  static TextStyle get body_R_80 => _buildStyle(16, FontWeight.normal, black, 0.8);
  static TextStyle get body_R_60 => _buildStyle(16, FontWeight.normal, black, 0.6);
  static TextStyle get body_R_40 => _buildStyle(16, FontWeight.normal, black, 0.4);
  static TextStyle get body_R_20 => _buildStyle(16, FontWeight.normal, black, 0.2);

  // ========== 正文2 (14px) ==========
  static TextStyle get body2_B => _buildStyle(14, FontWeight.bold, black, 1.0);
  static TextStyle get body2_B_80 => _buildStyle(14, FontWeight.bold, black, 0.8);
  static TextStyle get body2_B_60 => _buildStyle(14, FontWeight.bold, black, 0.6);
  static TextStyle get body2_B_40 => _buildStyle(14, FontWeight.bold, black, 0.4);
  static TextStyle get body2_B_20 => _buildStyle(14, FontWeight.bold, black, 0.2);

  static TextStyle get body2_M => _buildStyle(14, FontWeight.w500, black, 1.0);
  static TextStyle get body2_M_80 => _buildStyle(14, FontWeight.w500, black, 0.8);
  static TextStyle get body2_M_60 => _buildStyle(14, FontWeight.w500, black, 0.6);
  static TextStyle get body2_M_40 => _buildStyle(14, FontWeight.w500, black, 0.4);
  static TextStyle get body2_M_20 => _buildStyle(14, FontWeight.w500, black, 0.2);

  static TextStyle get body2_R => _buildStyle(14, FontWeight.normal, black, 1.0);
  static TextStyle get body2_R_80 => _buildStyle(14, FontWeight.normal, black, 0.8);
  static TextStyle get body2_R_60 => _buildStyle(14, FontWeight.normal, black, 0.6);
  static TextStyle get body2_R_40 => _buildStyle(14, FontWeight.normal, black, 0.4);
  static TextStyle get body2_R_20 => _buildStyle(14, FontWeight.normal, black, 0.2);

  // ========== 说明文字 (12px) ==========
  static TextStyle get caption_B => _buildStyle(12, FontWeight.bold, black, 1.0);
  static TextStyle get caption_B_80 => _buildStyle(12, FontWeight.bold, black, 0.8);
  static TextStyle get caption_B_60 => _buildStyle(12, FontWeight.bold, black, 0.6);
  static TextStyle get caption_B_40 => _buildStyle(12, FontWeight.bold, black, 0.4);
  static TextStyle get caption_B_20 => _buildStyle(12, FontWeight.bold, black, 0.2);

  static TextStyle get caption_M => _buildStyle(12, FontWeight.w500, black, 1.0);
  static TextStyle get caption_M_80 => _buildStyle(12, FontWeight.w500, black, 0.8);
  static TextStyle get caption_M_60 => _buildStyle(12, FontWeight.w500, black, 0.6);
  static TextStyle get caption_M_40 => _buildStyle(12, FontWeight.w500, black, 0.4);
  static TextStyle get caption_M_20 => _buildStyle(12, FontWeight.w500, black, 0.2);

  static TextStyle get caption_R => _buildStyle(12, FontWeight.normal, black, 1.0);
  static TextStyle get caption_R_80 => _buildStyle(12, FontWeight.normal, black, 0.8);
  static TextStyle get caption_R_60 => _buildStyle(12, FontWeight.normal, black, 0.6);
  static TextStyle get caption_R_40 => _buildStyle(12, FontWeight.normal, black, 0.4);
  static TextStyle get caption_R_20 => _buildStyle(12, FontWeight.normal, black, 0.2);

  // ========== 说明文字2 (11px) ==========
  static TextStyle get caption2_B => _buildStyle(11, FontWeight.bold, black, 1.0);
  static TextStyle get caption2_B_80 => _buildStyle(11, FontWeight.bold, black, 0.8);
  static TextStyle get caption2_B_60 => _buildStyle(11, FontWeight.bold, black, 0.6);
  static TextStyle get caption2_B_40 => _buildStyle(11, FontWeight.bold, black, 0.4);
  static TextStyle get caption2_B_20 => _buildStyle(11, FontWeight.bold, black, 0.2);

  static TextStyle get caption2_M => _buildStyle(11, FontWeight.w500, black, 1.0);
  static TextStyle get caption2_M_80 => _buildStyle(11, FontWeight.w500, black, 0.8);
  static TextStyle get caption2_M_60 => _buildStyle(11, FontWeight.w500, black, 0.6);
  static TextStyle get caption2_M_40 => _buildStyle(11, FontWeight.w500, black, 0.4);
  static TextStyle get caption2_M_20 => _buildStyle(11, FontWeight.w500, black, 0.2);

  static TextStyle get caption2_R => _buildStyle(11, FontWeight.normal, black, 1.0);
  static TextStyle get caption2_R_80 => _buildStyle(11, FontWeight.normal, black, 0.8);
  static TextStyle get caption2_R_60 => _buildStyle(11, FontWeight.normal, black, 0.6);
  static TextStyle get caption2_R_40 => _buildStyle(11, FontWeight.normal, black, 0.4);
  static TextStyle get caption2_R_20 => _buildStyle(11, FontWeight.normal, black, 0.2);

//===========================================================
//===============白色字体=====================================
//===========================================================
//===========================================================

  static TextStyle get w_title1_B => _buildStyle(24, FontWeight.bold, white, 1.0);
  static TextStyle get w_title1_B_80 => _buildStyle(24, FontWeight.bold, white, 0.8);
  static TextStyle get w_title1_B_60 => _buildStyle(24, FontWeight.bold, white, 0.6);
  static TextStyle get w_title1_B_40 => _buildStyle(24, FontWeight.bold, white, 0.4);
  static TextStyle get w_title1_B_20 => _buildStyle(24, FontWeight.bold, white, 0.2);

  static TextStyle get w_title1_M => _buildStyle(24, FontWeight.w500, white, 1.0);
  static TextStyle get w_title1_M_80 => _buildStyle(24, FontWeight.w500, white, 0.8);
  static TextStyle get w_title1_M_60 => _buildStyle(24, FontWeight.w500, white, 0.6);
  static TextStyle get w_title1_M_40 => _buildStyle(24, FontWeight.w500, white, 0.4);
  static TextStyle get w_title1_M_20 => _buildStyle(24, FontWeight.w500, white, 0.2);

  static TextStyle get w_title1_R => _buildStyle(24, FontWeight.normal, white, 1.0);
  static TextStyle get w_title1_R_80 => _buildStyle(24, FontWeight.normal, white, 0.8);
  static TextStyle get w_title1_R_60 => _buildStyle(24, FontWeight.normal, white, 0.6);
  static TextStyle get w_title1_R_40 => _buildStyle(24, FontWeight.normal, white, 0.4);
  static TextStyle get w_title1_R_20 => _buildStyle(24, FontWeight.normal, white, 0.2);

  // ========== 标题2 (22px) ==========
  static TextStyle get w_title2_B => _buildStyle(22, FontWeight.bold, white, 1.0);
  static TextStyle get w_title2_B_80 => _buildStyle(22, FontWeight.bold, white, 0.8);
  static TextStyle get w_title2_B_60 => _buildStyle(22, FontWeight.bold, white, 0.6);
  static TextStyle get w_title2_B_40 => _buildStyle(22, FontWeight.bold, white, 0.4);
  static TextStyle get w_title2_B_20 => _buildStyle(22, FontWeight.bold, white, 0.2);

  static TextStyle get w_title2_M => _buildStyle(22, FontWeight.w500, white, 1.0);
  static TextStyle get w_title2_M_80 => _buildStyle(22, FontWeight.w500, white, 0.8);
  static TextStyle get w_title2_M_60 => _buildStyle(22, FontWeight.w500, white, 0.6);
  static TextStyle get w_title2_M_40 => _buildStyle(22, FontWeight.w500, white, 0.4);
  static TextStyle get w_title2_M_20 => _buildStyle(22, FontWeight.w500, white, 0.2);

  static TextStyle get w_title2_R => _buildStyle(22, FontWeight.normal, white, 1.0);
  static TextStyle get w_title2_R_80 => _buildStyle(22, FontWeight.normal, white, 0.8);
  static TextStyle get w_title2_R_60 => _buildStyle(22, FontWeight.normal, white, 0.6);
  static TextStyle get w_title2_R_40 => _buildStyle(22, FontWeight.normal, white, 0.4);
  static TextStyle get w_title2_R_20 => _buildStyle(22, FontWeight.normal, white, 0.2);

  // ========== 标题3 (20px) ==========
  static TextStyle get w_title3_B => _buildStyle(20, FontWeight.bold, white, 1.0);
  static TextStyle get w_title3_B_80 => _buildStyle(20, FontWeight.bold, white, 0.8);
  static TextStyle get w_title3_B_60 => _buildStyle(20, FontWeight.bold, white, 0.6);
  static TextStyle get w_title3_B_40 => _buildStyle(20, FontWeight.bold, white, 0.4);
  static TextStyle get w_title3_B_20 => _buildStyle(20, FontWeight.bold, white, 0.2);

  static TextStyle get w_title3_M => _buildStyle(20, FontWeight.w500, white, 1.0);
  static TextStyle get w_title3_M_80 => _buildStyle(20, FontWeight.w500, white, 0.8);
  static TextStyle get w_title3_M_60 => _buildStyle(20, FontWeight.w500, white, 0.6);
  static TextStyle get w_title3_M_40 => _buildStyle(20, FontWeight.w500, white, 0.4);
  static TextStyle get w_title3_M_20 => _buildStyle(20, FontWeight.w500, white, 0.2);

  static TextStyle get w_title3_R => _buildStyle(20, FontWeight.normal, white, 1.0);
  static TextStyle get w_title3_R_80 => _buildStyle(20, FontWeight.normal, white, 0.8);
  static TextStyle get w_title3_R_60 => _buildStyle(20, FontWeight.normal, white, 0.6);
  static TextStyle get w_title3_R_40 => _buildStyle(20, FontWeight.normal, white, 0.4);
  static TextStyle get w_title3_R_20 => _buildStyle(20, FontWeight.normal, white, 0.2);

  // ========== 副标题 (18px) ==========
  static TextStyle get w_subtitle_B => _buildStyle(18, FontWeight.bold, white, 1.0);
  static TextStyle get w_subtitle_B_80 => _buildStyle(18, FontWeight.bold, white, 0.8);
  static TextStyle get w_subtitle_B_60 => _buildStyle(18, FontWeight.bold, white, 0.6);
  static TextStyle get w_subtitle_B_40 => _buildStyle(18, FontWeight.bold, white, 0.4);
  static TextStyle get w_subtitle_B_20 => _buildStyle(18, FontWeight.bold, white, 0.2);

  static TextStyle get w_subtitle_M => _buildStyle(18, FontWeight.w500, white, 1.0);
  static TextStyle get w_subtitle_M_80 => _buildStyle(18, FontWeight.w500, white, 0.8);
  static TextStyle get w_subtitle_M_60 => _buildStyle(18, FontWeight.w500, white, 0.6);
  static TextStyle get w_subtitle_M_40 => _buildStyle(18, FontWeight.w500, white, 0.4);
  static TextStyle get w_subtitle_M_20 => _buildStyle(18, FontWeight.w500, white, 0.2);

  static TextStyle get w_subtitle_R => _buildStyle(18, FontWeight.normal, white, 1.0);
  static TextStyle get w_subtitle_R_80 => _buildStyle(18, FontWeight.normal, white, 0.8);
  static TextStyle get w_subtitle_R_60 => _buildStyle(18, FontWeight.normal, white, 0.6);
  static TextStyle get w_subtitle_R_40 => _buildStyle(18, FontWeight.normal, white, 0.4);
  static TextStyle get w_subtitle_R_20 => _buildStyle(18, FontWeight.normal, white, 0.2);

  // ========== 正文 (16px) ==========
  static TextStyle get w_body_B => _buildStyle(16, FontWeight.bold, white, 1.0);
  static TextStyle get w_body_B_80 => _buildStyle(16, FontWeight.bold, white, 0.8);
  static TextStyle get w_body_B_60 => _buildStyle(16, FontWeight.bold, white, 0.6);
  static TextStyle get w_body_B_40 => _buildStyle(16, FontWeight.bold, white, 0.4);
  static TextStyle get w_body_B_20 => _buildStyle(16, FontWeight.bold, white, 0.2);

  static TextStyle get w_body_M => _buildStyle(16, FontWeight.w500, white, 1.0);
  static TextStyle get w_body_M_80 => _buildStyle(16, FontWeight.w500, white, 0.8);
  static TextStyle get w_body_M_60 => _buildStyle(16, FontWeight.w500, white, 0.6);
  static TextStyle get w_body_M_40 => _buildStyle(16, FontWeight.w500, white, 0.4);
  static TextStyle get w_body_M_20 => _buildStyle(16, FontWeight.w500, white, 0.2);

  static TextStyle get w_body_R => _buildStyle(16, FontWeight.normal, white, 1.0);
  static TextStyle get w_body_R_80 => _buildStyle(16, FontWeight.normal, white, 0.8);
  static TextStyle get w_body_R_60 => _buildStyle(16, FontWeight.normal, white, 0.6);
  static TextStyle get w_body_R_40 => _buildStyle(16, FontWeight.normal, white, 0.4);
  static TextStyle get w_body_R_20 => _buildStyle(16, FontWeight.normal, white, 0.2);

  // ========== 正文2 (14px) ==========
  static TextStyle get w_body2_B => _buildStyle(14, FontWeight.bold, white, 1.0);
  static TextStyle get w_body2_B_80 => _buildStyle(14, FontWeight.bold, white, 0.8);
  static TextStyle get w_body2_B_60 => _buildStyle(14, FontWeight.bold, white, 0.6);
  static TextStyle get w_body2_B_40 => _buildStyle(14, FontWeight.bold, white, 0.4);
  static TextStyle get w_body2_B_20 => _buildStyle(14, FontWeight.bold, white, 0.2);

  static TextStyle get w_body2_M => _buildStyle(14, FontWeight.w500, white, 1.0);
  static TextStyle get w_body2_M_80 => _buildStyle(14, FontWeight.w500, white, 0.8);
  static TextStyle get w_body2_M_60 => _buildStyle(14, FontWeight.w500, white, 0.6);
  static TextStyle get w_body2_M_40 => _buildStyle(14, FontWeight.w500, white, 0.4);
  static TextStyle get w_body2_M_20 => _buildStyle(14, FontWeight.w500, white, 0.2);

  static TextStyle get w_body2_R => _buildStyle(14, FontWeight.normal, white, 1.0);
  static TextStyle get w_body2_R_80 => _buildStyle(14, FontWeight.normal, white, 0.8);
  static TextStyle get w_body2_R_60 => _buildStyle(14, FontWeight.normal, white, 0.6);
  static TextStyle get w_body2_R_40 => _buildStyle(14, FontWeight.normal, white, 0.4);
  static TextStyle get w_body2_R_20 => _buildStyle(14, FontWeight.normal, white, 0.2);

  // ========== 说明文字 (12px) ==========
  static TextStyle get w_caption_B => _buildStyle(12, FontWeight.bold, white, 1.0);
  static TextStyle get w_caption_B_80 => _buildStyle(12, FontWeight.bold, white, 0.8);
  static TextStyle get w_caption_B_60 => _buildStyle(12, FontWeight.bold, white, 0.6);
  static TextStyle get w_caption_B_40 => _buildStyle(12, FontWeight.bold, white, 0.4);
  static TextStyle get w_caption_B_20 => _buildStyle(12, FontWeight.bold, white, 0.2);

  static TextStyle get w_caption_M => _buildStyle(12, FontWeight.w500, white, 1.0);
  static TextStyle get w_caption_M_80 => _buildStyle(12, FontWeight.w500, white, 0.8);
  static TextStyle get w_caption_M_60 => _buildStyle(12, FontWeight.w500, white, 0.6);
  static TextStyle get w_caption_M_40 => _buildStyle(12, FontWeight.w500, white, 0.4);
  static TextStyle get w_caption_M_20 => _buildStyle(12, FontWeight.w500, white, 0.2);

  static TextStyle get w_caption_R => _buildStyle(12, FontWeight.normal, white, 1.0);
  static TextStyle get w_caption_R_80 => _buildStyle(12, FontWeight.normal, white, 0.8);
  static TextStyle get w_caption_R_60 => _buildStyle(12, FontWeight.normal, white, 0.6);
  static TextStyle get w_caption_R_40 => _buildStyle(12, FontWeight.normal, white, 0.4);
  static TextStyle get w_caption_R_20 => _buildStyle(12, FontWeight.normal, white, 0.2);

  // ========== 说明文字2 (11px) ==========
  static TextStyle get w_caption2_B => _buildStyle(11, FontWeight.bold, white, 1.0);
  static TextStyle get w_caption2_B_80 => _buildStyle(11, FontWeight.bold, white, 0.8);
  static TextStyle get w_caption2_B_60 => _buildStyle(11, FontWeight.bold, white, 0.6);
  static TextStyle get w_caption2_B_40 => _buildStyle(11, FontWeight.bold, white, 0.4);
  static TextStyle get w_caption2_B_20 => _buildStyle(11, FontWeight.bold, white, 0.2);

  static TextStyle get w_caption2_M => _buildStyle(11, FontWeight.w500, white, 1.0);
  static TextStyle get w_caption2_M_80 => _buildStyle(11, FontWeight.w500, white, 0.8);
  static TextStyle get w_caption2_M_60 => _buildStyle(11, FontWeight.w500, white, 0.6);
  static TextStyle get w_caption2_M_40 => _buildStyle(11, FontWeight.w500, white, 0.4);
  static TextStyle get w_caption2_M_20 => _buildStyle(11, FontWeight.w500, white, 0.2);

  static TextStyle get w_caption2_R => _buildStyle(11, FontWeight.normal, white, 1.0);
  static TextStyle get w_caption2_R_80 => _buildStyle(11, FontWeight.normal, white, 0.8);
  static TextStyle get w_caption2_R_60 => _buildStyle(11, FontWeight.normal, white, 0.6);
  static TextStyle get w_caption2_R_40 => _buildStyle(11, FontWeight.normal, white, 0.4);
  static TextStyle get w_caption2_R_20 => _buildStyle(11, FontWeight.normal, white, 0.2);
}
