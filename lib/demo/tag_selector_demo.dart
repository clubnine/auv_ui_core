import 'package:auv_core/auv_ui_core/auv_dimens.dart';
import 'package:flutter/material.dart';
import 'package:auv_core/auv_ui_core/auv_tag_selector.dart';
import 'package:auv_core/auv_ui_core/auv_widget_enums.dart';
import 'package:auv_core/auv_ui_core/auv_gaps.dart';

class TagSelectorDemoApp extends StatelessWidget {
  const TagSelectorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV TagSelector 演示')),
      body: _TagSelectorDemoContent(),
    );
  }
}

class _TagSelectorDemoContent extends StatefulWidget {
  @override
  State<_TagSelectorDemoContent> createState() => _TagSelectorDemoContentState();
}

class _TagSelectorDemoContentState extends State<_TagSelectorDemoContent> {
  List<AuvTag> _selectedTags = [];

  final List<AuvTag> _tags = const [
    AuvTag(id: '1', name: '标签1'),
    AuvTag(id: '2', name: '标签2', checked: true),
    AuvTag(id: '3', name: '标签3'),
    AuvTag(id: '4', name: '标签4'),
    AuvTag(id: '5', name: '标签5'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDemoSection('基础用法', [
            AuvTagSelector(
              tags: _tags,
              onChanged: (tags) {
                setState(() {
                  _selectedTags = tags;
                });
              },
              selectedColor: Colors.blue,
              unselectedColor: Colors.grey[300]!,
            ),
            AuvGaps.vGap16,
            Text('已选择: ${_selectedTags.map((e) => e.name).join(', ')}'),
          ]),
          _buildDemoSection('单选模式', [
            AuvTagSelector(
              tags: _tags,
              onChanged: (tags) {
                setState(() {
                  _selectedTags = tags;
                });
              },
              selectedColor: Colors.blue,
              unselectedColor: Colors.grey[300]!,
              single: true, // 启用单选模式
            ),
            AuvGaps.vGap16,
            Text('已选择(单选): ${_selectedTags.isNotEmpty ? _selectedTags.first.name : "无"}'),
          ]),
          _buildDemoSection('带图标标签', [
            AuvTagSelector(
              tags: const [
                AuvTag(id: '6', name: '搜索', icon: 'http://image.amiya001.com/10001'),
                AuvTag(id: '7', name: '收藏', icon: 'http://image.amiya001.com/apple.png'),
                AuvTag(id: '8', name: '分享', icon: 'http://image.amiya001.com/google.png'),
              ],
              onChanged: (tags) {},
              selectedColor: Colors.green,
              unselectedColor: Colors.grey[300]!,
            ),
          ]),
          _buildDemoSection('不同尺寸', [
            AuvTagSelector(
              tags: const [
                AuvTag(id: '9', name: '小号'),
                AuvTag(id: '10', name: '小号'),
              ],
              onChanged: (tags) {},
              size: AuvWidgetSize.small,
              selectedColor: Colors.red,
              unselectedColor: Colors.grey[300]!,
            ),
            AuvGaps.vGap16,
            AuvTagSelector(
              tags: const [
                AuvTag(id: '11', name: '大号'),
                AuvTag(id: '12', name: '大号'),
              ],
              onChanged: (tags) {},
              size: AuvWidgetSize.large,
              selectedColor: Colors.purple,
              unselectedColor: Colors.grey[300]!,
            ),
          ]),
          _buildDemoSection('带图标的不同尺寸', [
            AuvTagSelector(
              tags: const [AuvTag(id: '13', name: '微', icon: 'http://image.amiya001.com/10001', checked: true)],
              onChanged: (tags) {},
              size: AuvWidgetSize.micro,
              selectedColor: Colors.orange,
              unselectedColor: Colors.grey[300]!,
            ),
            AuvGaps.vGap16,
            AuvTagSelector(
              tags: const [AuvTag(id: '13', name: '极小', icon: 'http://image.amiya001.com/10001', checked: true)],
              onChanged: (tags) {},
              size: AuvWidgetSize.mini,
              selectedColor: Colors.orange,
              unselectedColor: Colors.grey[300]!,
            ),
            AuvGaps.vGap16,
            AuvTagSelector(
              tags: const [AuvTag(id: '14', name: '小', icon: 'http://image.amiya001.com/10001')],
              onChanged: (tags) {},
              size: AuvWidgetSize.small,
              selectedColor: Colors.orange,
              unselectedColor: Colors.grey[300]!,
            ),
            AuvGaps.vGap16,
            AuvTagSelector(
              tags: const [AuvTag(id: '15', name: '中', icon: 'http://image.amiya001.com/10001', checked: true)],
              onChanged: (tags) {},
              size: AuvWidgetSize.middle,
              selectedColor: Colors.orange,
              unselectedColor: Colors.grey[300]!,
            ),
            AuvGaps.vGap16,
            AuvTagSelector(
              tags: const [AuvTag(id: '15', name: '大', icon: 'http://image.amiya001.com/10001', checked: true)],
              onChanged: (tags) {},
              size: AuvWidgetSize.large,
              selectedColor: Colors.orange,
              unselectedColor: Colors.grey[300]!,
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
