import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../auv_ui_core/auv_text.dart';
import '../auv_ui_core/auv_box.dart';
import '../auv_ui_core/auv_gaps.dart';
import '../auv_ui_core/auv_colors.dart';

class AuvTextDemoApp extends StatelessWidget {
  const AuvTextDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV Text 演示')),
      body: _AuvTextDemoContent(),
    );
  }
}

class _AuvTextDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDemoSection('预设样式', [
            AuvText.title1('标题1 - 24px 粗体').build(),
            AuvGaps.vGap8,
            AuvText.title2('标题2 - 22px 粗体').build(),
            AuvGaps.vGap8,
            AuvText.title3('标题3 - 20px 粗体').build(),
            AuvGaps.vGap8,
            AuvText.subtitle('副标题 - 18px 粗体').build(),
            AuvGaps.vGap8,
            AuvText.body('正文 - 16px 粗体').build(),
            AuvGaps.vGap8,
            AuvText.body2('正文2 - 14px 粗体').build(),
            AuvGaps.vGap8,
            AuvText.caption('说明文字 - 12px 粗体').build(),
            AuvGaps.vGap8,
            AuvText.caption2('说明文字2 - 11px 粗体').build(),
          ]),
          _buildDivider(),
          _buildDemoSection('链式调用', [
            AuvText('链式调用示例').title1().color(Colors.blue).build(),
            AuvGaps.vGap8,
            AuvText('粗体 + 斜体 + 下划线').body().italic().underline().build(),
            AuvGaps.vGap8,
            AuvText('自定义大小 + 颜色 + 字间距').color(Colors.purple).letterSpacing(2.0).build(),
            AuvGaps.vGap8,
            AuvText('单行省略文本 - 这是一段很长的文本，超出宽度会显示省略号').body2().singleLine().ellipsis().build(),
          ]),
          _buildDivider(),
          _buildDemoSection('对齐方式', [
            AuvBox().color(Colors.grey.withOpacity(0.2)).p12().build(
                  Column(
                    children: [
                      AuvText('左对齐文本').left().build(),
                      AuvGaps.vGap8,
                      AuvText('居中对齐文本').center().build(),
                      AuvGaps.vGap8,
                      AuvText('右对齐文本').right().build(),
                    ],
                  ),
                ),
          ]),
          _buildDivider(),
          _buildDemoSection('文本装饰', [
            AuvText('下划线文本').underline().build(),
            AuvGaps.vGap8,
            AuvText('彩色下划线').underline(color: Colors.red).build(),
            AuvGaps.vGap8,
            AuvText('删除线文本').strikethrough().build(),
            AuvGaps.vGap8,
            AuvText('双下划线').underline(style: TextDecorationStyle.double).build(),
            AuvGaps.vGap8,
            AuvText('波浪下划线').underline(style: TextDecorationStyle.wavy).build(),
          ]),
          _buildDivider(),
          _buildDemoSection('透明度', [
            AuvText('100% 不透明').body().build(),
            AuvGaps.vGap8,
            AuvText('80% 不透明').body().opacity(0.8).build(),
            AuvGaps.vGap8,
            AuvText('60% 不透明').body().opacity(0.6).build(),
            AuvGaps.vGap8,
            AuvText('40% 不透明').body().opacity(0.4).build(),
            AuvGaps.vGap8,
            AuvText('20% 不透明').body().opacity(0.2).build(),
          ]),
          _buildDivider(),
          _buildDemoSection('多行文本', [
            AuvBox().color(Colors.grey.withOpacity(0.2)).p12().build(
                  AuvText('这是一段多行文本，可以自动换行显示。这是一段多行文本，可以自动换行显示。这是一段多行文本，可以自动换行显示。').body().build(),
                ),
            AuvGaps.vGap8,
            AuvBox().color(Colors.grey.withOpacity(0.2)).p12().build(
                  AuvText('限制最大行数为2行，超出部分显示省略号。这是一段很长的文本，超出两行会显示省略号。这是一段很长的文本，超出两行会显示省略号。').body().maxLines(2).ellipsis().build(),
                ),
          ]),
          _buildDivider(),
          _buildDemoSection('组合样式', [
            AuvBox().color(AuvColors.primary).p12().build(
                  AuvText('白色文本 + 粗体 + 居中').title2().color(Colors.white).center().build(),
                ),
            AuvGaps.vGap8,
            AuvBox().color(Colors.amber).p12().build(
                  AuvText('黑色文本 + 斜体 + 下划线').subtitle().color(Colors.black).italic().underline(color: Colors.red).build(),
                ),
            AuvGaps.vGap8,
            AuvBox().color(Colors.green).p12().build(
                  AuvText('白色文本 + 字间距 + 行高').body().color(Colors.white).letterSpacing(2.0).height(1.5).build(),
                ),
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
          padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
          child: AuvText(title).title3().color(Colors.black87).build(),
        ),
        ...children,
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Divider(
        height: 1.h,
        thickness: 1.h,
        color: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
