import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 标准尺寸定义类（已集成屏幕适配）
///
/// 提供了一套完整的尺寸规范体系，基于8pt网格系统设计，自动适配不同屏幕尺寸。
/// 所有尺寸值已通过ScreenUtil的.w扩展方法实现响应式适配。
///
/// 尺寸等级体系：
/// 
///   ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
///   │ d2  │ d4  │ d8  │ d12 │ d16 │ d20 │ d24 │ d28 │ d32 │
///   │ (2) │ (4) │ (8) │(12) │(16) │(20) │(24) │(28) │(32) │
///   └─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┴─────┘
///
/// 使用指南：
/// 
/// 1. 基础尺寸应用：
///    Container(width: AuvDimensions.d8) // 8pt宽度
///
/// 2. 复合尺寸计算：
///    final padding = AuvDimensions.d8 + AuvDimensions.d4; // 12pt
///
/// 设计规范：
/// - 以8pt为基准单位，提供2-40pt完整尺寸阶梯
/// - 所有尺寸自动适配不同屏幕密度
/// - 尺寸值均为逻辑像素(pt)单位
/// - 通过.w扩展方法实现响应式适配
class AuvDimens {
  /// 2pt尺寸
  /// 适用于最小间距、细边框等场景
  static double get d2 => 2.w;
  
  /// 4pt尺寸
  /// 适用于小间距、图标内边距等场景
  static double get d4 => 4.w;
  
  /// 8pt基础单位尺寸
  /// 作为整个设计系统的基础单位
  static double get d8 => 8.w;
  
  /// 12pt尺寸
  /// 适用于中等间距、卡片内边距等场景
  static double get d12 => 12.w;
  
  /// 16pt尺寸
  /// 适用于大间距、区块间隔等场景
  static double get d16 => 16.w;
  
  /// 20pt尺寸
  /// 适用于特大间距、特殊布局等场景
  static double get d20 => 20.w;
  
  /// 24pt尺寸
  /// 适用于标题间距、大区块间隔等场景
  static double get d24 => 24.w;
  
  /// 28pt尺寸
  /// 适用于超大间距、特殊布局等场景
  static double get d28 => 28.w;
  
  /// 32pt尺寸
  /// 适用于最大间距、页面边距等场景
  static double get d32 => 32.w;
  
  /// 40pt尺寸
  /// 适用于特大间距、特殊布局等场景
  static double get d40 => 40.w;
}