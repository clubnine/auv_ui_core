import 'package:auv_ui_core/auv_ui_core/auv_box.dart';
import 'package:auv_ui_core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:auv_ui_core/auv_ui_core/auv_img_text.dart';
import 'package:auv_ui_core/auv_ui_core/auv_widget_enums.dart';
import 'package:auv_ui_core/auv_ui_core/auv_gaps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.all(16.w),
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
          _buildDivider(),
          _buildDemoSection('尺寸规格', [
            _buildImgTextItem('micro', AuvImgTextLayout.horizontal, size: AuvWidgetSize.micro),
            AuvGaps.vGap16,
            _buildImgTextItem('tiny', AuvImgTextLayout.horizontal, size: AuvWidgetSize.tiny),
            AuvGaps.vGap16,
            _buildImgTextItem('mini', AuvImgTextLayout.horizontal, size: AuvWidgetSize.mini),
            AuvGaps.vGap16,
            _buildImgTextItem('small', AuvImgTextLayout.horizontal, size: AuvWidgetSize.small),
            AuvGaps.vGap16,
            _buildImgTextItem('medium', AuvImgTextLayout.horizontal, size: AuvWidgetSize.medium),
            AuvGaps.vGap16,
            _buildImgTextItem('large', AuvImgTextLayout.horizontal, size: AuvWidgetSize.large),
          ]),
          _buildDivider(),
          _buildDemoSection('自定义尺寸', [
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().width(300.w).height(50.h).backgroundColor(Colors.blue.withOpacity(0.2)).build('文字'.fakeImg(width: 300), '固定宽高 300.w x 50.h'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().width(250.w).backgroundColor(Colors.blue.withOpacity(0.2)).build('文字'.fakeImg(width: 300), '固定宽度 250.w'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().height(60.h).backgroundColor(Colors.blue.withOpacity(0.2)).build('文字'.fakeImg(width: 300), '固定高度 60.h'),
                ),
          ]),
          _buildDivider(),
          _buildDemoSection('交互状态', [
            _buildImgTextItem('正常状态', AuvImgTextLayout.horizontal, onTap: () => debugPrint('点击了正常按钮')),
            AuvGaps.vGap16,
            _buildImgTextItem('禁用状态', AuvImgTextLayout.horizontal, backgroundColor: Colors.grey[200]),
          ]),
          _buildDivider(),
          _buildDemoSection('背景样式', [
            _buildImgTextItem('默认背景', AuvImgTextLayout.horizontal),
            AuvGaps.vGap16,
            _buildImgTextItem('红色背景', AuvImgTextLayout.horizontal, backgroundColor: Colors.red.withOpacity(0.3)),
            AuvGaps.vGap16,
            _buildImgTextItem('渐变背景', AuvImgTextLayout.horizontal,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.withOpacity(0.5), Colors.purple.withOpacity(0.5)],
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
          _buildDivider(),
          _buildDemoSection('边框设置', [
            AuvImgText()
                .border(color: Colors.blue) // 默认宽度1.0的蓝色边框
                .build('文字'.fakeImg(width: 300), '蓝色边框'),
            AuvGaps.vGap16,
            AuvImgText()
                .border(color: Colors.red, width: 2.0) // 宽度2.0的红色边框
                .build('文字'.fakeImg(width: 300), '红色粗边框'),
            AuvGaps.vGap16,
            AuvImgText()
                .border(color: Colors.green)
                .backgroundColor(Colors.grey[200]!) // 带背景色和边框
                .build('文字'.fakeImg(width: 300), '背景+边框'),
            AuvGaps.vGap16,
            AuvImgText()
                .border(color: Colors.purple)
                .borderRadius(BorderRadius.circular(20)) // 圆角边框
                .build('文字'.fakeImg(width: 300), '圆角边框'),
          ]),
          _buildDivider(),
          _buildDemoSection('图片设置', [
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().imageSize(40.w).backgroundColor(Colors.blue.withOpacity(0.2)).build('文字'.fakeImg(width: 300), '大图片 40.w'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().imageSize(20.w).backgroundColor(Colors.blue.withOpacity(0.2)).build('文字'.fakeImg(width: 300), '小图片 20.w'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().spacing(20.w).backgroundColor(Colors.blue.withOpacity(0.2)).build('文字'.fakeImg(width: 300), '大间距 20.w'),
                ),
          ]),
          _buildDivider(),
          _buildDemoSection('文本样式', [
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText()
                      .textStyle(TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ))
                      .backgroundColor(Colors.blue.withOpacity(0.2))
                      .build('文字'.fakeImg(width: 300), '自定义文本样式'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText()
                      .textStyle(TextStyle(
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ))
                      .backgroundColor(Colors.blue.withOpacity(0.2))
                      .build('文字'.fakeImg(width: 300), '斜体+下划线'),
                ),
          ]),
          _buildDivider(),
          _buildDemoSection('组合用法', [
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText()
                      .width(200.w)
                      .height(60.h)
                      .circle()
                      .backgroundColor(Colors.purple.withOpacity(0.3))
                      .textStyle(TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))
                      .build('WW'.fakeImg(width: 300), '圆形按钮'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText()
                      .width(double.infinity)
                      .height(50.h)
                      .borderRadius(BorderRadius.circular(25.h))
                      .decoration(BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ))
                      .textStyle(TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))
                      .build('文字'.fakeImg(width: 300), '渐变背景按钮'),
                ),
          ]),
          _buildDivider(),
          _buildDemoSection('无边框、无背景、无装饰', [
            Container(
                color: Colors.blue.withOpacity(0.2), //
                child: AuvImgText().micro().build('WW'.fakeImg(width: 300), '文字')),
            AuvGaps.vGap16,
            Container(
                color: Colors.blue.withOpacity(0.2), //
                child: AuvImgText().small().build('WW'.fakeImg(width: 300), '文字')),
            AuvGaps.vGap16,
            Container(
                color: Colors.blue.withOpacity(0.2), //
                child: AuvImgText().medium().build('WW'.fakeImg(width: 300), '文字')),
            AuvGaps.vGap16,
            Container(
                color: Colors.blue.withOpacity(0.2), //
                child: AuvImgText().large().build('WW'.fakeImg(width: 300), '文字')),
          ]),
          _buildDivider(),
          _buildDemoSection('纯文本模式', [
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().size(AuvWidgetSize.medium).backgroundColor(Colors.blue).textColor(Colors.white).build(null, '基础按钮'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().size(AuvWidgetSize.medium).backgroundColor(Colors.green).textColor(Colors.white).borderRadiusAll(20).build(null, '圆角按钮'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText().size(AuvWidgetSize.medium).border(color: Colors.orange, width: 2).textColor(Colors.orange).build(null, '边框按钮'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText()
                      .width(200.w)
                      .height(50.h)
                      .decoration(BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ))
                      .textColor(Colors.white)
                      .build(null, '渐变按钮'),
                ),
            AuvGaps.vGap16,
            AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
                  AuvImgText()
                      .size(AuvWidgetSize.medium)
                      .textStyle(TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ))
                      .build(null, '自定义文本样式'),
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
          child: Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
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

  Widget _buildImgTextItem(
    String text,
    AuvImgTextLayout layout, {
    AuvWidgetSize size = AuvWidgetSize.medium,
    Color? backgroundColor,
    Decoration? decoration,
    VoidCallback? onTap,
  }) {
    AuvImgText imgText = AuvImgText().layout(layout).size(size).backgroundColor(backgroundColor ?? Colors.blue.withOpacity(0.2));
    if (decoration != null) {
      imgText = imgText.decoration(decoration);
    }

    return AuvBox().color(Colors.blue.withOpacity(0.2)).p12().build(
          imgText.build(
            '文字'.fakeImg(width: 300),
            text,
          ),
        );
  }
}
