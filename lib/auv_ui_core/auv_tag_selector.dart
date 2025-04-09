import 'package:auv_core/auv_ui_core/auv_image.dart';
import 'package:auv_core/auv_ui_core/auv_img_text.dart';
import 'package:auv_core/auv_ui_core/auv_widget_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 标签选择器组件
///
/// 标签状态示例:
///
/// 未选中状态:
/// ╭───────────────╮
/// │  普通标签      │
/// ╰───────────────╯
///
/// 选中状态:
/// ╭───────────────╮
/// │  ★ 选中标签   │
/// ╰───────────────╯
/// (背景色: 主题色, 文字: 白色)
///
/// 带图标标签:
/// ╭───────────────╮
/// │ 🔍 搜索标签   │
/// ╰───────────────╯
///
/// 尺寸示例:
/// extraTiny: ╭─╮
///            │标│
///            ╰─╯
///
/// tiny:   ╭───╮
///         │标 │
///         ╰───╯
///
/// mini:   ╭─────╮
///         │标签 │
///         ╰─────╯
///
/// small:  ╭───────╮
///         │ 标签  │
///         ╰───────╯
///
/// middle: ╭─────────╮
///         │  标签   │
///         ╰─────────╯
///
/// large:  ╭───────────╮
///         │   标签    │
///         ╰───────────╯
///
/// 多选效果:
/// ╭───╮ ╭───╮ ╭───╮
/// │标1│ │标2│ │标3│
/// ╰───╯ ╰───╯ ╰───╯

class AuvTagSelector extends StatefulWidget {
  /// 可选的标签列表
  final List<AuvTag> tags;

  /// 当标签选择状态变化时的回调函数
  final ValueChanged<List<AuvTag>> onChanged;

  /// 整个选择器的内边距
  final EdgeInsetsGeometry? padding;

  /// 标签之间的水平间距，会根据size自动计算
  final double? spacing;

  /// 标签行之间的垂直间距，会根据size自动计算
  final double? runSpacing;

  /// 标签文字的样式，可选
  final TextStyle? textStyle;

  /// 选中标签的背景色，默认为主题色
  final Color selectedColor;

  /// 未选中标签的背景色，默认为灰色300
  final Color unselectedColor;

  /// 标签的圆角设置，默认为圆角16
  final BorderRadiusGeometry? borderRadius;

  /// 标签的尺寸大小，默认为中等大小
  final AuvWidgetSize size;

  /// 选中标签的文字颜色，默认为白色
  final Color selectedTextColor;

  /// 未选中标签的文字颜色，默认为黑色
  final Color unselectedTextColor;

  /// 是否为单选模式，默认为false(多选)
  final bool single;

  const AuvTagSelector({
    super.key,
    required this.tags,
    required this.onChanged,
    required this.selectedColor,
    required this.unselectedColor,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = Colors.black,
    this.padding,
    this.spacing,
    this.runSpacing,
    this.textStyle,
    this.borderRadius,
    this.size = AuvWidgetSize.medium,
    this.single = false, // 新增单选模式开关
  });

  @override
  State<AuvTagSelector> createState() => _AuvTagSelectorState();
}

class _AuvTagSelectorState extends State<AuvTagSelector> {
  late List<AuvTag> _selectedTags;

  @override
  void initState() {
    super.initState();
    _selectedTags = widget.tags.where((tag) => tag.checked).toList();
  }

  // 根据尺寸获取字体大小
  TextStyle _getTextStyle(BuildContext context) {
    final baseStyle = widget.textStyle ?? Theme.of(context).textTheme.bodyMedium;
    return baseStyle?.copyWith(
          fontSize: switch (widget.size) {
            AuvWidgetSize.micro => 8,
            AuvWidgetSize.tiny => 10,
            AuvWidgetSize.mini => 12,
            AuvWidgetSize.small => 14,
            AuvWidgetSize.medium => 16,
            AuvWidgetSize.large => 18,
          },
        ) ??
        const TextStyle();
  }

  // 新增方法：根据尺寸获取间距
  double _getSpacing() {
    return widget.spacing ??
        switch (widget.size) {
          AuvWidgetSize.micro => 4.w,
          AuvWidgetSize.tiny => 5.w,
          AuvWidgetSize.mini => 6.w,
          AuvWidgetSize.small => 8.w,
          AuvWidgetSize.medium => 10.w,
          AuvWidgetSize.large => 12.w,
        };
  }

  // 新增方法：根据尺寸获取行间距
  double _getRunSpacing() {
    return widget.runSpacing ??
        switch (widget.size) {
          AuvWidgetSize.micro => 4.w,
          AuvWidgetSize.tiny => 5.w,
          AuvWidgetSize.mini => 6.w,
          AuvWidgetSize.small => 8.w,
          AuvWidgetSize.medium => 10.w,
          AuvWidgetSize.large => 12.w,
        };
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = widget.borderRadius ?? BorderRadius.circular(100);

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Wrap(
        spacing: _getSpacing(),
        runSpacing: _getRunSpacing(),
        children: widget.tags.map((tag) {
          final isSelected = _selectedTags.any((t) => t.id == tag.id);

          // 使用AuvImgText构建标签
          return GestureDetector(
            onTap: () {
              setState(() {
                if (widget.single) {
                  // 单选模式处理
                  if (isSelected) {
                    _selectedTags.clear();
                  } else {
                    _selectedTags = [tag.copyWith(checked: true)];
                  }
                } else {
                  // 多选模式处理
                  if (isSelected) {
                    _selectedTags.removeWhere((t) => t.id == tag.id);
                  } else {
                    _selectedTags.add(tag.copyWith(checked: true));
                  }
                }
                widget.onChanged(_selectedTags);
              });
            },
            child: AuvImgText()
                .size(widget.size)
                .backgroundColor(isSelected ? widget.selectedColor : widget.unselectedColor)
                .borderRadius(effectiveBorderRadius)
                .textStyle(_getTextStyle(context).copyWith(
                  color: isSelected ? widget.selectedTextColor : widget.unselectedTextColor,
                ))
                .build(
                  tag.icon,
                  tag.name,
                ),
          );
        }).toList(),
      ),
    );
  }
}

class AuvTag {
  /// 标签的唯一标识符
  final String id;

  /// 标签显示的文字内容
  final String name;

  /// 标签是否被选中，默认为false
  final bool checked;

  /// 标签前的图片文件名称或图片url，可选
  final String? icon;

  const AuvTag({
    required this.id,
    required this.name,
    this.checked = false,
    this.icon,
  });

  AuvTag copyWith({
    String? id,
    String? name,
    bool? checked,
    String? icon,
  }) {
    return AuvTag(
      id: id ?? this.id,
      name: name ?? this.name,
      checked: checked ?? this.checked,
      icon: icon ?? this.icon,
    );
  }
}
