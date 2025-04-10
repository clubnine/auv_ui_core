import 'package:flutter/material.dart';
import 'package:auv_ui_core/auv_ui_core/auv_gaps.dart';
import 'package:flutter/widgets.dart';

class GapsDemoApp extends StatelessWidget {
  const GapsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV Gaps 演示')),
      body: _GapsDemoContent(),
    );
  }
}

class _GapsDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildGapSection('水平间距', [
            _buildGapItem('hGap4', AuvGaps.hGap4),
            _buildGapItem('hGap8', AuvGaps.hGap8),
            _buildGapItem('hGap12', AuvGaps.hGap12),
            _buildGapItem('hGap16', AuvGaps.hGap16),
            _buildGapItem('hGap24', AuvGaps.hGap24),
            _buildGapItem('hGap32', AuvGaps.hGap32),
          ]),
          _buildGapSection('垂直间距', [
            _buildGapItem('vGap4', AuvGaps.vGap4, isVertical: true),
            _buildGapItem('vGap8', AuvGaps.vGap8, isVertical: true),
            _buildGapItem('vGap12', AuvGaps.vGap12, isVertical: true),
            _buildGapItem('vGap16', AuvGaps.vGap16, isVertical: true),
            _buildGapItem('vGap24', AuvGaps.vGap24, isVertical: true),
            _buildGapItem('vGap32', AuvGaps.vGap32, isVertical: true),
          ]),
        ],
      ),
    );
  }

  Widget _buildGapSection(String title, List<Widget> children) {
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

  Widget _buildGapItem(String name, Widget gap, {bool isVertical = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            color: Colors.grey[200],
            child: isVertical
                ? Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.blue,
                      ),
                      gap,
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.purple,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                      gap, // 修改1：使用Expanded占据剩余空间
                      Expanded(
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
