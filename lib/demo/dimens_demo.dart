import 'package:auv_core/auv_ui_core/auv_space.dart';
import 'package:flutter/material.dart';
import 'package:auv_core/auv_ui_core/auv_gaps.dart';

class DimensDemoApp extends StatelessWidget {
  const DimensDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV Dimens 演示')),
      body: _DimensDemoContent(),
    );
  }
}

class _DimensDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildDimenSection('间距尺寸', [
            _buildDimenItem('2dp', 2),
            AuvGaps.vGap16,
            _buildDimenItem('4dp', 4),
            AuvGaps.vGap16,
            _buildDimenItem('8dp', 8),
            AuvGaps.vGap16,
            _buildDimenItem('12dp', 12),
            AuvGaps.vGap16,
            _buildDimenItem('16dp', 16),
            AuvGaps.vGap16,
            _buildDimenItem('24dp', 24),
            AuvGaps.vGap16,
            _buildDimenItem('32dp', 32),
          ]),
          _buildDimenSection('圆角尺寸', [
            _buildDimenItem('2dp', 2, isRadius: true),
            AuvGaps.vGap16,
            _buildDimenItem('4dp', 4, isRadius: true),
            AuvGaps.vGap16,
            _buildDimenItem('8dp', 8, isRadius: true),
            AuvGaps.vGap16,
            _buildDimenItem('12dp', 12, isRadius: true),
            AuvGaps.vGap16,
            _buildDimenItem('16dp', 16, isRadius: true),
            AuvGaps.vGap16,
            _buildDimenItem('24dp', 24, isRadius: true),
          ]),
          _buildDimenSection('图标尺寸', [
            _buildDimenItem('16dp', 16, isIcon: true),
            AuvGaps.vGap16,
            _buildDimenItem('24dp', 24, isIcon: true),
            AuvGaps.vGap16,
            _buildDimenItem('32dp', 32, isIcon: true),
            AuvGaps.vGap16,
            _buildDimenItem('48dp', 48, isIcon: true),
          ]),
        ],
      ),
    );
  }

  Widget _buildDimenItem(String name, double size,
      {bool isRadius = false, bool isIcon = false}) {
    return Container(
      width: double.infinity,
      // height: 60,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: isRadius ? BorderRadius.circular(size) : null,
        border: Border.all(color: Colors.blue),
      ),
      padding:   AuvSpace.s12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          isIcon
              ? Icon(Icons.circle, size: size, color: Colors.blue)
              : Container(
                  width: size,
                  height: size,
                  color: Colors.blue,
                ),
        ],
      ),
    );
  }
}

Widget _buildDimenSection(String title, List<Widget> children) {
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

Widget _buildDimenItem(String name, double size, {bool isRadius = false}) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.blue.withOpacity(0.1),
      borderRadius: isRadius ? BorderRadius.circular(size) : null,
      border: Border.all(color: Colors.blue),
    ),
    padding: const EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          width: size,
          height: size,
          color: Colors.blue,
        ),
      ],
    ),
  );
}
