import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerDemoPage extends StatelessWidget {
  const DividerDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分割线组件演示'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 水平分割线基础用法
            _buildSection('1. 水平分割线基础用法'),
            const Text('默认分割线'),
            const Divider(),
            const Text('带高度的分割线'),
            Container(
              color: Colors.blue.withOpacity(0.2),
              child: Divider(height: 40.h, thickness: 2.h),
            ),
            const Text('带颜色的分割线'),
            const Divider(color: Colors.red),
            const Text('带缩进的分割线'),
            const Divider(indent: 20, endIndent: 20),

            // 垂直分割线基础用法
            _buildSection('2. 垂直分割线基础用法'),
            SizedBox(
              height: 50.h, // 添加固定高度容器
              child: Row(
                children: [
                  const Text('左侧文本'),
                  const VerticalDivider(width: 20),
                  const Text('右侧文本'),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 50.h, // 添加固定高度容器
              child: Row(
                children: [
                  const Text('带颜色的'),
                  VerticalDivider(width: 2.w, thickness: 2, color: Colors.blue),
                  const Text('垂直分割线'),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 50.h, // 添加固定高度容器
              child: Row(
                children: [
                  const Text('带粗细的'),
                  VerticalDivider(width: 10.w, thickness: 2.w),
                  const Text('垂直分割线'),
                ],
              ),
            ),

            // 结合ListView使用
            _buildSection('3. 列表中的分割线'),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => ListTile(
                title: Text('项目 $index'),
              ),
              separatorBuilder: (context, index) => const Divider(),
            ),

            // 自定义分割线样式
            _buildSection('4. 自定义分割线样式'),
            Container(
              height: 2.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h),
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
