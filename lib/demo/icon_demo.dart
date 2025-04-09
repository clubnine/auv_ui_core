import 'package:auv_core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:auv_core/auv_ui_core/auv_icon.dart';
import 'package:auv_core/auv_ui_core/auv_gaps.dart';

class IconDemoApp extends StatelessWidget {
  const IconDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuvIcon 演示')),
      body: _IconDemoContent(),
    );
  }
}

class _IconDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDemoSection('基础图片图标', [
            AuvIcon.image('home'.fakeImg(width: 300), 40),
            AuvGaps.vGap16,
            AuvIcon.image('home'.fakeImg(width: 300), 50),
            AuvGaps.vGap16,
            AuvIcon.image('home'.fakeImg(width: 300), 30, opacity: 0.5),
          ]),
          _buildDemoSection('圆形图标', [
            AuvIcon.circle(
              AuvIcon.image('home'.fakeImg(width: 300), 60),
              30,
              color: Colors.blue,
            ),
            AuvGaps.vGap16,
            AuvIcon.circle(
              AuvIcon.image('22'.fakeImg(width: 300), 20),
              40,
              color: Colors.black.withOpacity(0.7),
              borderColor: Colors.grey,
              borderWidth: 2,
            ),
          ]),
          _buildDemoSection('ImageProvider使用', [
            Image(
              image: AuvIcon.provider('home'.fakeImg(width: 300)),
              width: 40,
              height: 40,
            ),
            AuvGaps.vGap16,
            Image(
              image: AuvIcon.provider('home'.fakeImg(width: 300)),
              width: 50,
              height: 50,
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
      ],
    );
  }
}
