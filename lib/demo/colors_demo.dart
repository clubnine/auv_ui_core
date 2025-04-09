import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auv_core/auv_ui_core/auv_colors.dart';
import 'package:auv_core/auv_ui_core/auv_gaps.dart';

class ColorsDemoApp extends StatelessWidget {
  const ColorsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV Colors 演示')),
      body: _ColorsDemoContent(),
    );
  }
}

class _ColorsDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildColorSection('主色调', [
            _buildColorBox('primary', AuvColors.primary),
            AuvGaps.vGap16,
            _buildColorBox('secondary', AuvColors.secondary),
          ]),
          _buildColorSection('背景色', [
            _buildColorBox('bgPrimary', AuvColors.bgPrimary),
            AuvGaps.vGap16,
            _buildColorBox('bgSecondary', AuvColors.bgSecondary),
            AuvGaps.vGap16,
            _buildColorBox('bgHighlight', AuvColors.bgHighlight),
            AuvGaps.vGap16,
            _buildColorBox('bgListItem', AuvColors.bgListItem),
          ]),
          _buildColorSection('状态色', [
            _buildColorBox('success', AuvColors.success),
            AuvGaps.vGap16,
            _buildColorBox('info', AuvColors.info),
            AuvGaps.vGap16,
            _buildColorBox('warning', AuvColors.warning),
            AuvGaps.vGap16,
            _buildColorBox('danger', AuvColors.danger),
          ]),
        ],
      ),
    );
  }

  Widget _buildColorSection(String title, List<Widget> children) {
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

  Widget _buildColorBox(String name, Color color) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              color:
                  color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '#${color.value.toRadixString(16).substring(2)}',
            style: TextStyle(
              color:
                  color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
