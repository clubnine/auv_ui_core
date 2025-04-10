import 'package:flutter/material.dart';
import 'package:auv_ui_core/auv_ui_core/auv_space.dart';
import 'package:auv_ui_core/auv_ui_core/auv_gaps.dart';

class SpaceDemoApp extends StatelessWidget {
  const SpaceDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV Space 演示')),
      body: _SpaceDemoContent(),
    );
  }
}

class _SpaceDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSpaceSection('全局间距', [
            _buildSpaceItem('s2', AuvSpace.s2),
            _buildSpaceItem('s4', AuvSpace.s4),
            _buildSpaceItem('s8', AuvSpace.s8),
            _buildSpaceItem('s12', AuvSpace.s12),
            _buildSpaceItem('s16', AuvSpace.s16),
            _buildSpaceItem('s20', AuvSpace.s20),
            _buildSpaceItem('s24', AuvSpace.s24),
            _buildSpaceItem('s28', AuvSpace.s28),
            _buildSpaceItem('s32', AuvSpace.s32),
            _buildSpaceItem('s40', AuvSpace.s40),
          ]),

          _buildSpaceSection('轴向间距', [
            _buildSpaceItem('h8', AuvSpace.h8),
            _buildSpaceItem('h16', AuvSpace.h16),
            _buildSpaceItem('v8', AuvSpace.v8),
            _buildSpaceItem('v16', AuvSpace.v16),
          ]),

          _buildSpaceSection('单边间距', [
            _buildSpaceItem('t8', AuvSpace.t8),
            _buildSpaceItem('b8', AuvSpace.b8),
            _buildSpaceItem('start8', AuvSpace.start8),
            _buildSpaceItem('end8', AuvSpace.end8),
          ]),
        ],
      ),
    );
  }

  Widget _buildSpaceSection(String title, List<Widget> children) {
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

  Widget _buildSpaceItem(String name, EdgeInsetsGeometry space) {
    return Container(
      margin: AuvSpace.s12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Container(
              padding: space,
              color: Colors.purple.withOpacity(0.2),
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
