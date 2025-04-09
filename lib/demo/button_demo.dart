import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auv_core/auv_ui_core/auv_button.dart';
import 'package:auv_core/auv_ui_core/auv_widget_enums.dart';
import 'package:auv_core/auv_ui_core/auv_gaps.dart';

class ButtonDemoApp extends StatelessWidget {
  const ButtonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppButton 演示')),
      body: _AppButtonDemoContent(),
    );
  }
}

class _AppButtonDemoContent extends StatelessWidget {
  void _handleButtonPress(String text) {
    debugPrint('按钮被点击: $text');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDemoSection('基础按钮类型', [
            AuvButton()
                .onPressed(() => _handleButtonPress('主要按钮'))
                .type(AuvWidgetType.primary)
                .micro()
                .text('主要按钮'),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() => _handleButtonPress('成功按钮'))
                .type(AuvWidgetType.success)
                .mini()
                .text('成功按钮'),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() => _handleButtonPress('警告按钮'))
                .type(AuvWidgetType.warning)
                .middle()
                .text('警告按钮'),
          ]),
          _buildDemoSection('图文按钮', [
            AuvButton()
                .onPressed(() => _handleButtonPress('主要按钮'))
                .type(AuvWidgetType.primary)
                .micro()
                .imgText('http://image.amiya001.com/10001', '主要按钮'),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() => _handleButtonPress('成功按钮'))
                .type(AuvWidgetType.success)
                .mini()
                .imgText('http://image.amiya001.com/10001', '主要按钮'),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() => _handleButtonPress('警告按钮'))
                .type(AuvWidgetType.warning)
                .middle()
                .circle()
                .imgText('http://image.amiya001.com/10001', '主要按钮'),
          ]),
          _buildDemoSection('按钮尺寸', [
            AuvButton()
                .onPressed(() => _handleButtonPress('微型按钮'))
                .size(AuvWidgetSize.micro)
                .build(const Text('微型按钮')),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() => _handleButtonPress('小型按钮'))
                .size(AuvWidgetSize.small)
                .build(const Text('小型按钮')),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() => _handleButtonPress('大型按钮'))
                .size(AuvWidgetSize.large)
                .build(const Text('大型按钮')),
          ]),
          _buildDemoSection('按钮形状', [
            AuvButton().onPressed(() {}).radius(8).build(const Text('圆角按钮')),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() {})
                .circle()
                .width(60)
                .height(60)
                //
                .build(const Text('圆形按钮')),
          ]),
          _buildDemoSection('按钮状态', [
            AuvButton().onPressed(() {}).build(const Text('正常按钮')),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() {})
                .disabled(true)
                .build(const Text('禁用按钮')),
          ]),
          _buildDemoSection('高级用法', [
            AuvButton()
                .tiny()
                .onPressed(() {})
                .backgroundColor(Colors.purple)
                .textColor(Colors.white)
                .borderColor(Colors.deepPurple)
                .radius(20)
                .build(const Text('自定义样式')),
            AuvGaps.vGap16,
            AuvButton().onPressed(() {}).shadow([
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ]).build(const Text('带阴影按钮')),
            AuvGaps.vGap16,
            AuvButton()
                .onPressed(() => _handleButtonPress('带背景图'))
                .width(200)
                .height(60)
                .build(const Text('带背景图')),
          ]),
        ],
      ),
    );
  }

  Widget _buildDemoSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        ...children,
      ],
    );
  }
}
