import 'package:auv_core/auv_ui_core/auv_image_net.dart';
import 'package:auv_core/auv_ui_core/auv_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auv_core/auv_ui_core/auv_box.dart';
import 'package:auv_core/auv_ui_core/auv_gaps.dart';

class BoxDemoApp extends StatelessWidget {
  const BoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBox 演示')),
      body: _AppBoxDemoContent(),
    );
  }
}

class _AppBoxDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AuvSpace.h16,
      child: Column(
        children: [
          _buildDemoSection('基础样式', [
            _buildDemoBox('默认样式', AuvBox()),
            _buildDemoBox('自定义背景色', AuvBox().color(Colors.blue)),
            _buildDemoBox('大圆角', AuvBox().r24().color(Colors.green)),
            _buildDemoBox('边框', AuvBox().border(Border.all(color: Colors.red, width: 2))),
            _buildDemoBox('阴影', AuvBox().elevation(8).circle().shadowColor(Colors.purple.withOpacity(0.3))),
          ]),
          _buildDemoSection('全局间距', [
            _buildDemoBox('内边距 p16', AuvBox().p16().r16().border(Border.all(color: Colors.red, width: 1)).color(Colors.yellow)),
            _buildDemoBox('外边距 m16', AuvBox().m16().color(Colors.red)),
            _buildDemoBox('组合使用', AuvBox().p8().m8().color(Colors.red)),
          ]),
          _buildDemoSection('轴向间距', [
            _buildDemoBox('水平内边距 ph16', AuvBox().ph16().color(Colors.yellow)),
            _buildDemoBox('垂直内边距 pv16', AuvBox().pv16().color(Colors.yellow)),
            _buildDemoBox('水平外边距 mh16', AuvBox().mh16().color(Colors.yellow)),
            _buildDemoBox('垂直外边距 mv16', AuvBox().mv16().color(Colors.yellow)),
          ]),
          _buildDemoSection('单边间距', [
            _buildDemoBox('顶部 pt16', AuvBox().pt16().color(Colors.yellow)),
            _buildDemoBox('底部 pb16', AuvBox().pb16().color(Colors.yellow)),
            _buildDemoBox('起始 ps16', AuvBox().ps16().color(Colors.yellow)),
            _buildDemoBox('结束 pe16', AuvBox().pe16().color(Colors.yellow)),
            _buildDemoBox('顶部外边距 mt16', AuvBox().mt16().color(Colors.yellow)),
            _buildDemoBox('底部外边距 mb16', AuvBox().mb16().color(Colors.yellow)),
          ]),
          _buildDemoSection('组合用法', [
            _buildDemoBox('卡片1', AuvBox().color(Colors.white).r12().p16().m8().elevation(4).border(Border.all(color: Colors.grey[300]!))),
            _buildDemoBox('卡片2', AuvBox().color(Colors.blue[50]!).r8().ph16().pv8().mt16().mb8()),
          ]),
          _buildDemoSection('背景装饰', [
            _buildDemoBox(
              '线性渐变背景',
              AuvBox().decoration(BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )),
            ),
            _buildDemoBox(
              '径向渐变背景',
              AuvBox().decoration(BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.yellow, Colors.orange],
                  center: Alignment.topCenter,
                ),
              )),
            ),
            _buildDemoBox(
              '图片背景',
              AuvBox().decoration(BoxDecoration(
                image: DecorationImage(
                  image: AuvImageNet.provider('https://picsum.photos/200/300'),
                  fit: BoxFit.cover,
                ),
              )),
            ),
            _buildDemoBox(
              '组合背景',
              AuvBox().decoration(BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                image: DecorationImage(
                  image: AuvImageNet.provider('https://picsum.photos/200/300'),
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              )),
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
          padding: const EdgeInsets.only(top: 24, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        ...children,
        AuvGaps.vGap20,
      ],
    );
  }

  Widget _buildDemoBox(String label, AuvBox box) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.w, bottom: 4.w),
          child: Text(label, style: const TextStyle(color: Colors.grey)),
        ),
        Container(
          color: Colors.black45,
          child: box.build(
            Container(
              width: double.infinity,
              color: Colors.pink.withOpacity(0.2),
              height: 60,
              alignment: Alignment.center,
              child: const Text('内容区域'),
            ),
          ),
        ),
        AuvGaps.vGap20,
      ],
    );
  }
}
