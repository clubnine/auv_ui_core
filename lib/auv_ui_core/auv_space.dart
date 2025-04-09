import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auv_dimens.dart';

/// 基于8pt网格系统的间距工具类
///
/// 提供了一套完整的间距规范体系，支持LTR/RTL双向布局，符合Material Design设计规范。
///
/// 间距等级体系：
///
///   ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
///   │ s2  │ s4  │ s8  │ s12 │ s16 │ s20 │ s24 │ s28 │ s32 │
///   │ (2) │ (4) │ (8) │(12) │(16) │(20) │(24) │(28) │(32) │
///   └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
///
/// 使用指南：
///
/// 1. 基础间距应用：
///    Container(margin: AuvSpacing.s16) // 16pt外边距
///
/// 2. 方向性间距(自动适配RTL)：
///    Container(padding: AuvSpacing.start8) // 起始边8pt内边距
///
/// 3. 轴向间距：
///    Container(margin: AuvSpacing.v8) // 垂直8pt外边距
///
/// 4. 复合间距：
///    Container(
///      margin: AuvSpacing.only(top: 12, bottom: 8),
///    )
///
/// 设计规范：
/// - 以8pt为基准单位，提供2-40pt完整间距阶梯
/// - 支持动态方向适配(start/end)
/// - 提供水平和垂直轴向间距
/// - 包含单边间距定制能力
class AuvSpace {
  /// 基础单位 (8pt)
  static double get unit => AuvDimens.d8;

  // ========== 全局间距 ==========
  /// 2pt全局间距
  static EdgeInsets get s2 => EdgeInsets.all(AuvDimens.d2);
  
  /// 4pt全局间距
  static EdgeInsets get s4 => EdgeInsets.all(AuvDimens.d4);
  
  /// 8pt全局间距(基础单位)
  static EdgeInsets get s8 => EdgeInsets.all(unit);
  
  /// 12pt全局间距
  static EdgeInsets get s12 => EdgeInsets.all(AuvDimens.d12);
  
  /// 16pt全局间距
  static EdgeInsets get s16 => EdgeInsets.all(unit * 2);
  
  /// 20pt全局间距
  static EdgeInsets get s20 => EdgeInsets.all(20.0.w);
  
  /// 24pt全局间距
  static EdgeInsets get s24 => EdgeInsets.all(unit * 3);
  
  /// 28pt全局间距
  static EdgeInsets get s28 => EdgeInsets.all(28.0.w);
  
  /// 32pt全局间距
  static EdgeInsets get s32 => EdgeInsets.all(unit * 4);
  
  /// 40pt全局间距
  static EdgeInsets get s40 => EdgeInsets.all(unit * 5);

  // ========== 轴向间距 ==========
  /// 水平8pt间距
  static EdgeInsets get h8 => EdgeInsets.symmetric(horizontal: unit);
  
  /// 水平16pt间距
  static EdgeInsets get h16 => EdgeInsets.symmetric(horizontal: unit * 2);
  
  /// 垂直8pt间距
  static EdgeInsets get v8 => EdgeInsets.symmetric(vertical: unit);
  
  /// 垂直16pt间距
  static EdgeInsets get v16 => EdgeInsets.symmetric(vertical: unit * 2);

  // ========== 单边间距 ==========
  /// 顶部8pt间距
  static EdgeInsets get t8 => EdgeInsets.only(top: unit);
  
  /// 底部8pt间距
  static EdgeInsets get b8 => EdgeInsets.only(bottom: unit);
  
  /// 开始8pt间距(支持RTL)
  static EdgeInsetsDirectional get start8 => EdgeInsetsDirectional.only(start: unit);
  
  /// 结束8pt间距(支持RTL)
  static EdgeInsetsDirectional get end8 => EdgeInsetsDirectional.only(end: unit);

  // ========== 外边距快捷方法 ==========
  /// 顶部2pt外边距
  static EdgeInsets get mt2 => EdgeInsets.only(top: AuvDimens.d2);
  
  /// 顶部4pt外边距
  static EdgeInsets get mt4 => EdgeInsets.only(top: AuvDimens.d4);
  
  /// 顶部8pt外边距
  static EdgeInsets get mt8 => EdgeInsets.only(top: unit);
  
  /// 顶部12pt外边距
  static EdgeInsets get mt12 => EdgeInsets.only(top: AuvDimens.d12);
  
  /// 顶部16pt外边距
  static EdgeInsets get mt16 => EdgeInsets.only(top: unit * 2);
  
  /// 底部2pt外边距
  static EdgeInsets get mb2 => EdgeInsets.only(bottom: AuvDimens.d2);
  
  /// 底部4pt外边距
  static EdgeInsets get mb4 => EdgeInsets.only(bottom: AuvDimens.d4);
  
  /// 底部8pt外边距
  static EdgeInsets get mb8 => EdgeInsets.only(bottom: unit);
  
  /// 底部12pt外边距
  static EdgeInsets get mb12 => EdgeInsets.only(bottom: AuvDimens.d12);
  
  /// 底部16pt外边距
  static EdgeInsets get mb16 => EdgeInsets.only(bottom: unit * 2);

  // ========== 内边距快捷方法 ==========
  /// 顶部2pt内边距
  static EdgeInsets get pt2 => EdgeInsets.only(top: AuvDimens.d2);
  
  /// 顶部4pt内边距
  static EdgeInsets get pt4 => EdgeInsets.only(top: AuvDimens.d4);
  
  /// 顶部8pt内边距
  static EdgeInsets get pt8 => EdgeInsets.only(top: unit);
  
  /// 顶部12pt内边距
  static EdgeInsets get pt12 => EdgeInsets.only(top: AuvDimens.d12);
  
  /// 顶部16pt内边距
  static EdgeInsets get pt16 => EdgeInsets.only(top: unit * 2);
  
  /// 底部2pt内边距
  static EdgeInsets get pb2 => EdgeInsets.only(bottom: AuvDimens.d2);
  
  /// 底部4pt内边距
  static EdgeInsets get pb4 => EdgeInsets.only(bottom: AuvDimens.d4);
  
  /// 底部8pt内边距
  static EdgeInsets get pb8 => EdgeInsets.only(bottom: unit);
  
  /// 底部12pt内边距
  static EdgeInsets get pb12 => EdgeInsets.only(bottom: AuvDimens.d12);
  
  /// 底部16pt内边距
  static EdgeInsets get pb16 => EdgeInsets.only(bottom: unit * 2);

  // ========== 复合间距 ==========
  /// 自定义间距快捷方法(支持RTL)
  static EdgeInsetsDirectional only({
    double? start,
    double? top,
    double? end,
    double? bottom,
  }) {
    return EdgeInsetsDirectional.only(
      start: start ?? 0,
      top: top ?? 0,
      end: end ?? 0,
      bottom: bottom ?? 0,
    );
  }
}
