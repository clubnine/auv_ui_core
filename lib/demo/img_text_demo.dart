import 'package:auv_core/auv_ui_core/auv_box.dart';
import 'package:flutter/material.dart';
import 'package:auv_core/auv_ui_core/auv_img_text.dart';
import 'package:auv_core/auv_ui_core/auv_widget_enums.dart';
import 'package:auv_core/auv_ui_core/auv_gaps.dart';

class ImgTextDemoApp extends StatelessWidget {
  const ImgTextDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV ImgText 演示')),
      body: _ImgTextDemoContent(),
    );
  }
}

class _ImgTextDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDemoSection('布局类型', [
            _buildImgTextItem('水平布局', AuvImgTextLayout.horizontal),
            AuvGaps.vGap16,
            _buildImgTextItem('水平反向布局', AuvImgTextLayout.horizontalReverse),
            AuvGaps.vGap16,
            _buildImgTextItem('垂直布局', AuvImgTextLayout.vertical),
            AuvGaps.vGap16,
            _buildImgTextItem('垂直反向布局', AuvImgTextLayout.verticalReverse),
          ]),
          _buildDemoSection('尺寸规格', [
            _buildImgTextItem('micro', AuvImgTextLayout.horizontal,
                size: AuvWidgetSize.micro),
            AuvGaps.vGap16,
            _buildImgTextItem('tiny', AuvImgTextLayout.horizontal,
                size: AuvWidgetSize.tiny),
            AuvGaps.vGap16,
            _buildImgTextItem('mini', AuvImgTextLayout.horizontal,
                size: AuvWidgetSize.mini),
            AuvGaps.vGap16,
            _buildImgTextItem('small', AuvImgTextLayout.horizontal,
                size: AuvWidgetSize.small),
            AuvGaps.vGap16,
            _buildImgTextItem('middle', AuvImgTextLayout.horizontal,
                size: AuvWidgetSize.middle),
            AuvGaps.vGap16,
            _buildImgTextItem('large', AuvImgTextLayout.horizontal,
                size: AuvWidgetSize.large),
          ]),
          _buildDemoSection('交互状态', [
            _buildImgTextItem('正常状态', AuvImgTextLayout.horizontal,
                onTap: () => debugPrint('点击了正常按钮')),
            AuvGaps.vGap16,
            _buildImgTextItem('禁用状态', AuvImgTextLayout.horizontal,
                backgroundColor: Colors.grey[200]),
          ]),
          _buildDemoSection('背景样式', [
            _buildImgTextItem('默认背景', AuvImgTextLayout.horizontal),
            AuvGaps.vGap16,
            _buildImgTextItem('红色背景', AuvImgTextLayout.horizontal,
                backgroundColor: Colors.red.withOpacity(0.3)),
            AuvGaps.vGap16,
            _buildImgTextItem('渐变背景', AuvImgTextLayout.horizontal,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.5),
                      Colors.purple.withOpacity(0.5)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                )),
            AuvGaps.vGap16,
            _buildImgTextItem('圆角背景', AuvImgTextLayout.horizontal,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                )),
          ]),
          _buildDemoSection('边框设置', [
            AuvImgText()
                .border(color: Colors.blue) // 默认宽度1.0的蓝色边框
                .build('https://picsum.photos/200/300', '蓝色边框'),
            AuvGaps.vGap16,
            AuvImgText()
                .border(color: Colors.red, width: 2.0) // 宽度2.0的红色边框
                .build('https://picsum.photos/200/300', '红色粗边框'),
            AuvGaps.vGap16,
            AuvImgText()
                .border(color: Colors.green)
                .backgroundColor(Colors.grey[200]!) // 带背景色和边框
                .build('https://picsum.photos/200/300', '背景+边框'),
            AuvGaps.vGap16,
            AuvImgText()
                .border(color: Colors.purple)
                .borderRadius(BorderRadius.circular(20)) // 圆角边框
                .build('https://picsum.photos/200/300', '圆角边框'),
          ]),
          _buildDemoSection('无边框、无背景、无装饰', [
            AuvImgText().micro().build('https://picsum.photos/200/300', '文字'),
            AuvImgText().small().build('https://picsum.photos/200/300', '文字'),
            AuvImgText().middle().build('https://picsum.photos/200/300', '文字'),
            AuvImgText().large().build('https://picsum.photos/200/300', '文字'),
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

  Widget _buildImgTextItem(
    String text,
    AuvImgTextLayout layout, {
    AuvWidgetSize size = AuvWidgetSize.middle,
    Color? backgroundColor,
    Decoration? decoration,
    VoidCallback? onTap,
  }) {
    AuvImgText imgText = AuvImgText()
        .layout(layout)
        .size(size)
        .backgroundColor(backgroundColor ?? Colors.blue.withOpacity(0.2));
    if (decoration != null) {
      imgText = imgText.decoration(decoration);
    }

    return AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
          imgText.build(
            'https://picsum.photos/200/300',
            text,
          ),
        );
  }
}
