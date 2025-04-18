import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auv_ui_core/auv_ui_core/auv_button.dart';
import 'package:auv_ui_core/auv_ui_core/auv_widget_enums.dart';
import 'package:auv_ui_core/auv_ui_core/auv_gaps.dart';

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
            AuvButton().primary().micro().click(() => {}).text('primary'),
            AuvButton().secondary().tiny().click(() => {}).text('secondary'),
            AuvButton().success().mini().click(() => {}).text('success'),
            AuvButton().warning().small().click(() => {}).text('warning'),
            AuvButton().danger().medium().click(() => {}).text('danger'),
            AuvButton().info().large().click(() => {}).text('info'),
            AuvButton().info().large().width(double.infinity).click(() => {}).text('info'),
            AuvButton().info().large().width(200).circle().click(() => {}).text('info'),
            AuvButton().info().large().height(60).circle().r16().click(() => {}).text('超大按钮1'),
            AuvGaps.vGap16,
          ]),
          _buildDemoSection('图文按钮', [
            AuvButton().click(() => _handleButtonPress('主要按钮')).type(AuvWidgetType.primary).micro().imgText('http://image.amiya001.com/10001', '主要按钮'),
            AuvGaps.vGap16,
            AuvButton().click(() => _handleButtonPress('成功按钮')).type(AuvWidgetType.success).mini().imgText('http://image.amiya001.com/10001', '主要按钮'),
            AuvGaps.vGap16,
            AuvButton()
                .click(() => _handleButtonPress('警告按钮'))
                .type(AuvWidgetType.warning)
                .medium()
                .circle()
                .imgText('http://image.amiya001.com/10001', '主要按钮'),
          ]),
          _buildDemoSection('按钮尺寸', [
            AuvButton().click(() => _handleButtonPress('微型按钮')).size(AuvWidgetSize.micro).build(const Text('微型按钮')),
            AuvGaps.vGap16,
            AuvButton().click(() => _handleButtonPress('小型按钮')).size(AuvWidgetSize.small).build(const Text('小型按钮')),
            AuvGaps.vGap16,
            AuvButton().click(() => _handleButtonPress('大型按钮')).size(AuvWidgetSize.large).build(const Text('大型按钮')),
          ]),
          _buildDemoSection('按钮形状', [
            AuvButton().click(() {}).radius(8).build(const Text('圆角按钮')),
            AuvGaps.vGap16,
            AuvButton()
                .click(() {})
                .circle()
                .width(60)
                .height(60)
                //
                .build(const Text('圆形按钮')),
          ]),
          _buildDemoSection('按钮宽高', [
            AuvButton().primary().medium().width(200.w).click(() => _handleButtonPress('固定宽度')).text('固定宽度 200.w'),
            AuvGaps.vGap16,
            AuvButton().success().medium().height(50.h).click(() => _handleButtonPress('固定高度')).text('固定高度 50.h'),
            AuvGaps.vGap16,
            AuvButton().warning().medium().width(150.w).height(45.h).click(() => _handleButtonPress('固定宽高')).text('固定宽高 150.w x 45.h'),
            AuvGaps.vGap16,
            AuvButton().info().medium().width(double.infinity).click(() => _handleButtonPress('全宽按钮')).text('全宽按钮'),
            AuvGaps.vGap16,
            AuvButton().danger().medium().width(120.w).height(120.w).click(() => _handleButtonPress('正方形按钮')).text('正方形\n120.w'),
          ]),
          _buildDemoSection('按钮状态', [
            AuvButton().click(() {}).build(const Text('正常按钮')),
            AuvGaps.vGap16,
            AuvButton().click(() {}).disabled(true).build(const Text('禁用按钮')),
          ]),
          _buildDemoSection('高级用法', [
            AuvButton()
                .tiny()
                .click(() {})
                .backgroundColor(Colors.purple)
                .textColor(Colors.white)
                .border(Colors.red, width: 3)
                .circle()
                .build(const Text('自定义样式')),
            AuvGaps.vGap16,
            // 新增渐变背景按钮
            AuvButton()
                .medium()
                .click(() {})
                .decoration(BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ))
                .textColor(Colors.white)
                .build(const Text('渐变背景')),
            AuvGaps.vGap16,

            // 新增背景图按钮
            AuvButton()
                .large()
                .radius(100)
                .click(() {})
                .decoration(BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/200/300'),
                    fit: BoxFit.cover,
                  ),
                  // borderRadius: BorderRadius.circular(12),
                ))
                .textColor(Colors.white)
                .build(const Text('背景图片')),
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
