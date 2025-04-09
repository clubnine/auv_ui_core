import 'package:auv_core/auv_ui_core/auv_gaps.dart';
import 'package:flutter/material.dart';

class AppBarDemoPage extends StatelessWidget {
  const AppBarDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBox 演示')),
      body: ListView(
        children: [
          _buildDemoItem(
            '基础AppBar',
            AppBar(
              leading: Icon(Icons.arrow_back),
              title: Text('标题', style: TextStyle(fontSize: 16)),
            ),
          ),
          _buildDemoItem(
            '带操作按钮',
            AppBar(
              title: Text('带操作按钮'),
              actions: [
                Icon(Icons.search),
                SizedBox(width: 16),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          _buildDemoItem(
            '自定义背景',
            AppBar(
              title: const Text('自定义背景'),
              backgroundColor: Colors.blue,
            ),
          ),
          _buildDemoItem(
            '无阴影',
            AppBar(
              title: Text('无阴影'),
              elevation: 0,
            ),
          ),
          _buildDemoItem(
            '大阴影',
            AppBar(
              title: Text('大阴影'),
              elevation: 8,
              shadowColor: Colors.black26,
            ),
          ),
          _buildDemoItem(
            '标题左对齐',
            AppBar(
              title: Text('标题左对齐'),
            ),
          ),
          _buildDemoItem(
            '自定义标题组件',
            AppBar(
              leading: null,
              actions: [AuvGaps.hGap44],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 8),
                  Text('自定义标题'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoItem(String title, Widget appBar) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          color: Colors.blue.withOpacity(0.2),
          margin: const EdgeInsets.only(bottom: 20),
          child: appBar,
        ),
      ],
    );
  }
}
