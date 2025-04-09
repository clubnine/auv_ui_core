import 'package:flutter/material.dart';
import 'package:auv_core/auv_ui_core/auv_image_net.dart';
import 'package:auv_core/auv_ui_core/auv_gaps.dart';

class ImageLoaderDemoApp extends StatelessWidget {
  const ImageLoaderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ImageLoader 演示')),
      body: const ImageLoaderDemoPage(),
    );
  }
}

class ImageLoaderDemoPage extends StatefulWidget {
  const ImageLoaderDemoPage({super.key});

  @override
  State<ImageLoaderDemoPage> createState() => _ImageLoaderDemoPageState();
}

class _ImageLoaderDemoPageState extends State<ImageLoaderDemoPage> {
  // 添加默认尺寸常量
  static const double defaultImageWidth = 200;
  static const double defaultImageHeight = 150;
  final String testImageUrl =
      'http://image.amiya001.com/Sv1ErLxXXuypN9Js2u5PuKc3';
  final String testImageAvatar = 'http://image.amiya001.com/10001';
  final String defaultAvatarUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildDemoSection('基础用法', [
            _buildDemoItem(
                '默认加载',
                AuvImageNet.image(
                  testImageUrl,
                  width: defaultImageWidth, // 添加明确宽度
                  height: defaultImageHeight, // 添加明确高度
                )),
            _buildDemoItem(
                '自定义尺寸',
                AuvImageNet.image(
                  testImageUrl,
                  width: 150,
                  height: 100,
                )),
          ]),
          _buildDemoSection('裁剪类型', [
            _buildDemoItem(
                '小图(60px)',
                AuvImageNet.image(
                  testImageUrl,
                  clip: ImageClipType.small,
                  width: 60,
                  height: 60,
                )),
            _buildDemoItem(
                '中图(150px)',
                AuvImageNet.image(
                  testImageUrl,
                  clip: ImageClipType.middle,
                  width: 150,
                  height: 150,
                )),
            _buildDemoItem(
                '大图(600px)',
                AuvImageNet.image(testImageUrl,
                    clip: ImageClipType.large, width: 600, height: 600)),
            _buildDemoItem(
                '自定义尺寸(200px)',
                AuvImageNet.image(
                  testImageUrl,
                  clip: ImageClipType.custom,
                  length: 200,
                  width: 200,
                  height: 200,
                )),
          ]),
          _buildDemoSection('形状处理', [
            _buildDemoItem(
                '圆形图片',
                AuvImageNet.image(
                  testImageUrl,
                  width: 100, // 明确宽度
                  height: 100, // 明确高度
                  boxShape: BoxShape.circle,
                )),
            _buildDemoItem(
                '圆角矩形',
                AuvImageNet.image(
                  testImageUrl,
                  width: 150,
                  height: 100,
                  borderRadius: BorderRadius.circular(12),
                )),
          ]),
          _buildDemoSection('默认头像处理', [
            _buildDemoItem(
                '默认头像',
                AuvImageNet.image(
                  defaultAvatarUrl,
                  width: 80,
                  height: 80,
                  boxShape: BoxShape.circle,
                )),
          ]),
          _buildDemoSection('错误处理', [
            _buildDemoItem(
                '错误占位图',
                AuvImageNet.image(
                  'https://invalid.url/image.jpg',
                  width: 150,
                  height: 100,
                )),
            _buildDemoItem(
                '自定义错误占位图',
                AuvImageNet.image(
                  'https://invalid.url/image.jpg',
                  width: 150,
                  height: 100,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                )),
          ]),
          _buildDemoSection('其他方法', [
            ...List.generate(4, (index) {
              return _buildDemoItem(
                  '默认头像加载',
                  AuvImageNet.image(
                    "http://image.amiya001.com/${10001 + index}",
                    width: 150,
                    height: 150,
                    borderRadius: BorderRadius.circular(75),
                  ));
            })
          ]),
          _buildDemoSection('便捷API演示', [
            _buildDemoItem(
              'large方法',
              AuvImageNet.large(
                url: testImageUrl,
                width: 200,
                height: 150,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            _buildDemoItem(
              'circle方法',
              AuvImageNet.circle(
                url: testImageUrl,
                size: 100,
              ),
            ),
            _buildDemoItem(
              'round方法',
              AuvImageNet.round(
                url: testImageUrl,
                width: 200,
                height: 150,
                // fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            _buildDemoItem(
              'small方法',
              AuvImageNet.small(
                url: testImageUrl,
                width: 80,
                height: 80,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            _buildDemoItem(
              'middle方法',
              AuvImageNet.middle(
                url: testImageUrl,
                width: 120,
                height: 120,
                borderRadius: BorderRadius.circular(20),
              ),
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

  Widget _buildDemoItem(String label, Widget imageWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Text(label, style: const TextStyle(color: Colors.grey)),
        ),
        Container(color: Colors.blue.withOpacity(0.2), child: imageWidget),
        AuvGaps.vGap16,
      ],
    );
  }
}
