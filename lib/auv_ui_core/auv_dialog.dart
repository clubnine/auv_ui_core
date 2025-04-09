import 'package:flutter/material.dart';

/// 应用对话框组件
///
/// 警告对话框示例:
/// ╭───────────────────────────────────────╮
/// │ ⚠️ 操作警告                            │
/// │                                       │
/// │ 您确定要删除此项吗？此操作不可撤销。     │
/// │                                       │
/// │           ┌───────────────┐           │
/// │           │    确 定      │           │
/// │           └───────────────┘           │
/// ╰───────────────────────────────────────╯
///
/// 确认对话框示例:
/// ╭───────────────────────────────────────╮
/// │ ❓ 确认操作                             │
/// │                                       │
/// │ 您确定要提交此表单吗？                  │
/// │                                       │
/// │    ┌─────────────┐ ┌───────────────┐   │
/// │    │   取 消     │ │    确 定      │   │
/// │    └─────────────┘ └───────────────┘   │
/// ╰───────────────────────────────────────╯
///
/// 输入对话框示例:
/// ╭───────────────────────────────────────╮
/// │ ✏️ 请输入信息                          │
/// │                                       │
/// │ ┌───────────────────────────────────┐ │
/// │ │                                   │ │
/// │ └───────────────────────────────────┘ │
/// │                                       │
/// │    ┌─────────────┐ ┌───────────────┐   │
/// │    │   取 消     │ │    确 定      │   │
/// │    └─────────────┘ └───────────────┘   │
/// ╰───────────────────────────────────────╯
///
/// 加载对话框示例:
/// ╭───────────────────────────────────────╮
/// │ 🔄 处理中...                          │
/// │                                       │
/// │          请稍候...                    │
/// │                                       │
/// │            ○○○○○○                     │
/// ╰───────────────────────────────────────╯
///
/// 多选对话框示例:
/// ╭───────────────────────────────────────╮
/// │ ☑ 请选择                               │
/// │                                       │
/// │  ○ 选项1                              │
/// │  ───────────────────────────────────  │
/// │  ● 选项2 (已选)                       │
/// │  ───────────────────────────────────  │
/// │  ○ 选项3                              │
/// ╰───────────────────────────────────────╯
///
/// 配置参数说明:
/// - ⚠️/❓/✏️: 对话框类型图标
/// - ┌─┐/└─┘: 按钮样式
/// - ○/●: 单选按钮状态
/// - ───: 分隔线样式

class AuvDialog {
  static const AuvDialogConfig defaultConfig = AuvDialogConfig();

  /// 警告对话框
  static Future<void> alert({
    required BuildContext context,
    required String title,
    required String content,
    Widget? icon,
    AuvDialogConfig config = const AuvDialogConfig(),
  }) {
    return base(
      context: context,
      config: config,
      child: _buildDialogContent(
        title: title,
        content: content,
        icon: icon,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  /// 确认对话框
  static Future<bool?> confirm({
    required BuildContext context,
    required String title,
    required String content,
    Widget? icon,
    AuvDialogConfig config = const AuvDialogConfig(),
  }) {
    return base<bool>(
      context: context,
      config: config,
      child: _buildDialogContent(
        title: title,
        content: content,
        icon: icon,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  /// 输入对话框
  static Future<String?> prompt({
    required BuildContext context,
    required String title,
    String? hintText,
    TextInputType? keyboardType,
    AuvDialogConfig config = const AuvDialogConfig(),
  }) {
    final controller = TextEditingController();
    return base<String>(
      context: context,
      config: config,
      child: _buildDialogContent(
        title: title,
        content: '',
        actions: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: hintText),
            keyboardType: keyboardType,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, controller.text),
                child: const Text('确定'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 基础对话框（添加自动关闭功能）
  static Future<T?> base<T>({
    required BuildContext context,
    required Widget child,
    AuvDialogConfig config = const AuvDialogConfig(),
  }) async {
    final result = await showDialog<T>(
      context: context,
      barrierDismissible: config.barrierDismissible,
      barrierColor: config.barrierColor,
      builder: (context) => _buildDialogWidget(child, config),
    );

    return result;
  }

  /// 对话框Widget构建（分离构建逻辑）
  static Widget _buildDialogWidget(Widget child, AuvDialogConfig config) {
    return Dialog(
      insetPadding: config.insetPadding,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: config.margin,
        decoration: config.decoration != null
            ? BoxDecoration(
                color: config.decoration is BoxDecoration
                    ? (config.decoration as BoxDecoration).color
                    : config.backgroundColor,
                image: config.decoration is BoxDecoration
                    ? (config.decoration as BoxDecoration).image
                    : null,
                borderRadius: BorderRadius.circular(config.borderRadius),
                boxShadow: config.shadow,
              )
            : BoxDecoration(
                color: config.backgroundColor,
                borderRadius: BorderRadius.circular(config.borderRadius),
                boxShadow: config.shadow,
              ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(config.borderRadius),
          child: Material(
            color: config.backgroundColor,
            child: child,
          ),
        ),
      ),
    );
  }

  /// 增强版对话框内容构建
  static Widget _buildDialogContent({
    required String title,
    required String content,
    Widget? icon,
    List<Widget>? actions,
    EdgeInsetsGeometry padding = const EdgeInsets.all(20),
    TextAlign contentAlign = TextAlign.center, // 新增内容对齐方式
  }) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (icon != null) ...[
            Center(child: icon),
            const SizedBox(height: 16),
          ],
          Text(title, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(content, textAlign: contentAlign),
          if (actions != null) ...[
            const SizedBox(height: 24),
            ...actions,
          ],
        ],
      ),
    );
  }

  /// 优化后的多选对话框（添加配置支持）
  static Future<int?> multiChoice({
    required BuildContext context,
    required String title,
    required List<String> options,
    Widget? icon,
    AuvDialogConfig config = const AuvDialogConfig(),
  }) {
    return base<int>(
      context: context,
      config: config,
      child: _buildDialogContent(
        title: title,
        content: '',
        icon: icon,
        actions: [
          ...options.asMap().entries.map((entry) => Column(
                children: [
                  ListTile(
                    title: Text(entry.value),
                    onTap: () => Navigator.pop(context, entry.key),
                  ),
                  if (entry.key != options.length - 1) const Divider(height: 1),
                ],
              )),
        ],
      ),
    );
  }

  /// 底部对齐对话框
  static Future<T?> bottom<T>({
    required BuildContext context,
    required Widget child,
    AuvDialogConfig config = const AuvDialogConfig(),
  }) async {
    final result = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: config.barrierColor,
      isDismissible: config.barrierDismissible,
      builder: (context) => Container(
        margin: config.margin,
        decoration: config.decoration ??
            BoxDecoration(
              color: config.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(config.borderRadius),
                topRight: Radius.circular(config.borderRadius),
              ),
            ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(config.borderRadius),
            topRight: Radius.circular(config.borderRadius),
          ),
          child: Material(
            color: config.backgroundColor,
            child: SafeArea(
              child: child,
            ),
          ),
        ),
      ),
    );

    return result;
  }
}

class AuvDialogConfig {
  /// 点击遮罩层是否可以关闭对话框，默认为true
  final bool barrierDismissible;

  /// 遮罩层颜色，默认为透明
  final Color barrierColor;

  /// 对话框内边距，控制对话框内容与边界的间距
  /// 默认为EdgeInsets.all(24)
  final EdgeInsets insetPadding;

  /// 对话框装饰样式，可自定义背景色、边框等
  final Decoration? decoration;

  /// 对话框背景颜色，默认为白色
  /// 当decoration不为空时，此属性可能被覆盖
  final Color backgroundColor;

  /// 对话框圆角大小，默认为12
  final double borderRadius;

  /// 对话框外边距，控制对话框与屏幕边界的间距
  final EdgeInsets? margin;

  /// 对话框阴影效果，可选
  final List<BoxShadow>? shadow;

  const AuvDialogConfig({
    this.barrierDismissible = true,
    this.barrierColor = Colors.black45,
    this.insetPadding = const EdgeInsets.all(24),
    this.decoration,
    this.backgroundColor = Colors.white,
    this.borderRadius = 12,
    this.margin,
    this.shadow, // 新增阴影配置
  });

  // 修改copyWith方法
  AuvDialogConfig copyWith({
    bool? barrierDismissible,
    Color? barrierColor,
    EdgeInsets? insetPadding,
    Decoration? decoration,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsets? margin,
    List<BoxShadow>? shadow, // 新增阴影配置
  }) {
    return AuvDialogConfig(
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      barrierColor: barrierColor ?? this.barrierColor,
      insetPadding: insetPadding ?? this.insetPadding,
      decoration: decoration ?? this.decoration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      margin: margin ?? this.margin,
      shadow: shadow ?? this.shadow, // 新增阴影配置
    );
  }
}
