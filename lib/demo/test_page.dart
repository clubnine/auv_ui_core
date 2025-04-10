// lib/demo/test_page.dart

import 'package:auv_ui_core/auv_ui_core/auv_box.dart';
import 'package:auv_ui_core/auv_ui_core/auv_gaps.dart';
import 'package:auv_ui_core/auv_ui_core/auv_img_text.dart';
import 'package:auv_ui_core/auv_ui_core/auv_button.dart';
import 'package:auv_ui_core/auv_ui_core/auv_text.dart';
import 'package:auv_ui_core/auv_ui_core/auv_text_styles.dart';
import 'package:auv_ui_core/auv_ui_core/auv_widget_enums.dart';
import 'package:auv_ui_core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AuvText('组合展示页面').style(AuvTextStyles.w_body2_B).build(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: AuvBox().p16().color(Colors.blue[100]!).borderRadius(8.r).build(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuvText('组合展示').style(AuvTextStyles.w_body2_B).build(),
                    AuvGaps.vGap16, // 添加垂直间隙

                    // AuvImgText 组件
                    AuvImgText()
                        .size(AuvWidgetSize.medium)
                        .backgroundColor(Colors.yellow[100]!)
                        .borderRadiusAll(8)
                        .padding(EdgeInsets.all(8.w))
                        .textStyle(AuvTextStyles.body2_R)
                        .build('S'.fakeImg(), '这是一个 AuvImgText 示例'),

                    AuvGaps.vGap16, // 添加垂直间隙

                    // 使用 AuvImgText 作为按钮内容
                    AuvButton().m12().height(44).width(double.infinity).primary().circle().click(() {
                      print('按钮被点击');
                    }).build(
                      Center(
                        child: AuvImgText().size(AuvWidgetSize.small).build('S'.fakeImg(), '点击我'), // 替换为你的图标路径
                      ),
                    ),
                    AuvButton().m12().height(44).width(double.infinity).primary().circle().click(() {
                      print('按钮被点击');
                    }).build(
                      Center(
                        child: AuvImgText().small().textStyle(AuvTextStyles.w_body2_B).build('X'.fakeImg(), '点击我'), // 替换为你的图标路径
                      ),
                    ),
                  ],
                ),
              ),
        ));
  }
}
