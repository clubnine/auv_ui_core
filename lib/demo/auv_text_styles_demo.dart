import 'package:flutter/material.dart';
import '../auv_ui_core/auv_text_styles.dart';

class AuvTextStylesDemo extends StatelessWidget {
  const AuvTextStylesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV 字体样式演示')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('黑色字体'),
            _buildStyleGroup('标题1 (24px)', [
              AuvTextStyles.title1_B_80,
              AuvTextStyles.title1_B_60,
              AuvTextStyles.title1_B_40,
              AuvTextStyles.title1_B_20,
              AuvTextStyles.title1_M_80,
              AuvTextStyles.title1_M_60,
              AuvTextStyles.title1_M_40,
              AuvTextStyles.title1_M_20,
              AuvTextStyles.title1_R_80,
              AuvTextStyles.title1_R_60,
              AuvTextStyles.title1_R_40,
              AuvTextStyles.title1_R_20,
            ]),
            _buildStyleGroup('标题2 (22px)', [
              AuvTextStyles.title2_B_80,
              AuvTextStyles.title2_B_60,
              AuvTextStyles.title2_B_40,
              AuvTextStyles.title2_B_20,
              AuvTextStyles.title2_M_80,
              AuvTextStyles.title2_M_60,
              AuvTextStyles.title2_M_40,
              AuvTextStyles.title2_M_20,
              AuvTextStyles.title2_R_80,
              AuvTextStyles.title2_R_60,
              AuvTextStyles.title2_R_40,
              AuvTextStyles.title2_R_20,
            ]),
            _buildStyleGroup('标题3 (20px)', [
              AuvTextStyles.title3_B_80,
              AuvTextStyles.title3_B_60,
              AuvTextStyles.title3_B_40,
              AuvTextStyles.title3_B_20,
              AuvTextStyles.title3_M_80,
              AuvTextStyles.title3_M_60,
              AuvTextStyles.title3_M_40,
              AuvTextStyles.title3_M_20,
              AuvTextStyles.title3_R_80,
              AuvTextStyles.title3_R_60,
              AuvTextStyles.title3_R_40,
              AuvTextStyles.title3_R_20,
            ]),
            _buildStyleGroup('副标题 (18px)', [
              AuvTextStyles.subtitle_B_80,
              AuvTextStyles.subtitle_B_60,
              AuvTextStyles.subtitle_B_40,
              AuvTextStyles.subtitle_B_20,
              AuvTextStyles.subtitle_M_80,
              AuvTextStyles.subtitle_M_60,
              AuvTextStyles.subtitle_M_40,
              AuvTextStyles.subtitle_M_20,
              AuvTextStyles.subtitle_R_80,
              AuvTextStyles.subtitle_R_60,
              AuvTextStyles.subtitle_R_40,
              AuvTextStyles.subtitle_R_20,
            ]),
            _buildStyleGroup('正文 (16px)', [
              AuvTextStyles.body_B_80,
              AuvTextStyles.body_B_60,
              AuvTextStyles.body_B_40,
              AuvTextStyles.body_B_20,
              AuvTextStyles.body_M_80,
              AuvTextStyles.body_M_60,
              AuvTextStyles.body_M_40,
              AuvTextStyles.body_M_20,
              AuvTextStyles.body_R_80,
              AuvTextStyles.body_R_60,
              AuvTextStyles.body_R_40,
              AuvTextStyles.body_R_20,
            ]),
            _buildStyleGroup('正文2 (14px)', [
              AuvTextStyles.body2_B_80,
              AuvTextStyles.body2_B_60,
              AuvTextStyles.body2_B_40,
              AuvTextStyles.body2_B_20,
              AuvTextStyles.body2_M_80,
              AuvTextStyles.body2_M_60,
              AuvTextStyles.body2_M_40,
              AuvTextStyles.body2_M_20,
              AuvTextStyles.body2_R_80,
              AuvTextStyles.body2_R_60,
              AuvTextStyles.body2_R_40,
              AuvTextStyles.body2_R_20,
            ]),
            _buildStyleGroup('说明文字 (12px)', [
              AuvTextStyles.caption_B_80,
              AuvTextStyles.caption_B_60,
              AuvTextStyles.caption_B_40,
              AuvTextStyles.caption_B_20,
              AuvTextStyles.caption_M_80,
              AuvTextStyles.caption_M_60,
              AuvTextStyles.caption_M_40,
              AuvTextStyles.caption_M_20,
              AuvTextStyles.caption_R_80,
              AuvTextStyles.caption_R_60,
              AuvTextStyles.caption_R_40,
              AuvTextStyles.caption_R_20,
            ]),
            _buildStyleGroup('说明文字2 (11px)', [
              AuvTextStyles.caption2_B_80,
              AuvTextStyles.caption2_B_60,
              AuvTextStyles.caption2_B_40,
              AuvTextStyles.caption2_B_20,
              AuvTextStyles.caption2_M_80,
              AuvTextStyles.caption2_M_60,
              AuvTextStyles.caption2_M_40,
              AuvTextStyles.caption2_M_20,
              AuvTextStyles.caption2_R_80,
              AuvTextStyles.caption2_R_60,
              AuvTextStyles.caption2_R_40,
              AuvTextStyles.caption2_R_20,
            ]),
            const SizedBox(height: 32),
            _buildSection('白色字体'),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildStyleGroup('白色标题1 (24px)', [
                    AuvTextStyles.w_title1_B_80,
                    AuvTextStyles.w_title1_B_60,
                    AuvTextStyles.w_title1_B_40,
                    AuvTextStyles.w_title1_B_20,
                    AuvTextStyles.w_title1_M_80,
                    AuvTextStyles.w_title1_M_60,
                    AuvTextStyles.w_title1_M_40,
                    AuvTextStyles.w_title1_M_20,
                    AuvTextStyles.w_title1_R_80,
                    AuvTextStyles.w_title1_R_60,
                    AuvTextStyles.w_title1_R_40,
                    AuvTextStyles.w_title1_R_20,
                  ]),
                  _buildStyleGroup('白色标题2 (22px)', [
                    AuvTextStyles.w_title2_B_80,
                    AuvTextStyles.w_title2_B_60,
                    AuvTextStyles.w_title2_B_40,
                    AuvTextStyles.w_title2_B_20,
                    AuvTextStyles.w_title2_M_80,
                    AuvTextStyles.w_title2_M_60,
                    AuvTextStyles.w_title2_M_40,
                    AuvTextStyles.w_title2_M_20,
                    AuvTextStyles.w_title2_R_80,
                    AuvTextStyles.w_title2_R_60,
                    AuvTextStyles.w_title2_R_40,
                    AuvTextStyles.w_title2_R_20,
                  ]),
                  // ... 其他白色字体分组
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: AuvTextStyles.title2_B_80,
      ),
    );
  }

  Widget _buildStyleGroup(String title, List<TextStyle> styles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Text(title, style: AuvTextStyles.body_B_80),
        ),
        ...styles.map((style) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '示例 - ${style.fontWeight!.value} ${style.fontSize}pt ${style.color?.opacity}',
                style: style,
              ),
            )),
        const Divider(height: 24, thickness: 1),
      ],
    );
  }
}
