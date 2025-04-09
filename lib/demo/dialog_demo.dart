import 'package:auv_core/auv_ui_core/auv_image_net.dart';
import 'package:flutter/material.dart';
import 'package:auv_core/auv_ui_core/auv_dialog.dart';

class DialogDemoApp extends StatelessWidget {
  const DialogDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV Dialog 演示')),
      body: _DialogDemoContent(),
    );
  }
}

class _DialogDemoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoItem(
          context,
          '警告对话框',
          Icons.warning,
          () => AuvDialog.alert(
            context: context,
            title: '操作警告',
            content: '您确定要删除此项吗？此操作不可撤销。',
            icon: const Icon(Icons.warning, color: Colors.orange),
          ),
        ),
        _buildDemoItem(
          context,
          '确认对话框',
          Icons.question_mark,
          () => AuvDialog.confirm(
            context: context,
            title: '确认操作',
            content: '您确定要提交此表单吗？',
          ).then((confirmed) {
            if (confirmed == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('已确认')),
              );
            }
          }),
        ),
        _buildDemoItem(
          context,
          '输入对话框',
          Icons.edit,
          () => AuvDialog.prompt(
            context: context,
            title: '请输入信息',
            hintText: '在此输入内容...',
          ).then((value) {
            if (value != null && value.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('输入内容: $value')),
              );
            }
          }),
        ),
        _buildDemoItem(
          context,
          '多选对话框',
          Icons.check_box,
          () => AuvDialog.multiChoice(
            context: context,
            title: '请选择',
            options: const ['选项1', '选项2', '选项3'],
          ).then((index) {
            if (index != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('选择了选项${index + 1}')),
              );
            }
          }),
        ),
        // 新增不同配置的alert对话框演示
        _buildDemoSection('警告对话框配置演示'),
        _buildDemoItem(
          context,
          '默认配置警告',
          Icons.settings,
          () => AuvDialog.alert(
            context: context,
            title: '默认配置',
            content: '使用默认DialogConfig配置',
            icon: const Icon(Icons.settings, color: Colors.blue),
          ),
        ),
        _buildDemoItem(
          context,
          '不可关闭警告',
          Icons.block,
          () => AuvDialog.alert(
            context: context,
            title: '不可关闭',
            content: '必须点击确定按钮才能关闭',
            icon: const Icon(Icons.block, color: Colors.red),
            config: const AuvDialogConfig(barrierDismissible: false),
          ),
        ),
        _buildDemoItem(
          context,
          '圆角警告',
          Icons.rounded_corner,
          () => AuvDialog.alert(
            context: context,
            title: '大圆角',
            content: '圆角设置为24',
            config: const AuvDialogConfig(borderRadius: 24),
          ),
        ),
        _buildDemoItem(
          context,
          '自定义背景警告',
          Icons.color_lens,
          () => AuvDialog.alert(
            context: context,
            title: '自定义背景',
            content: '使用浅紫色背景',
            config: const AuvDialogConfig(backgroundColor: Colors.purpleAccent),
          ),
        ),
        _buildDemoItem(
          context,
          '背景图片警告',
          Icons.image,
          () => AuvDialog.alert(
            context: context,
            title: '带背景图片',
            content: '使用网络图片作为对话框背景',
            config: AuvDialogConfig(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AuvImageNet.provider('http://image.amiya001.com/10001'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        // 新增底部弹窗演示
        _buildDemoSection('底部弹窗演示'),
        _buildDemoItem(
          context,
          '简单底部弹窗',
          Icons.vertical_align_bottom,
          () => AuvDialog.bottom(
            context: context,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('这是一个底部弹窗示例'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('关闭'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        _buildDemoItem(
          context,
          '带列表的底部弹窗',
          Icons.list,
          () => AuvDialog.bottom(
            context: context,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('请选择一个选项'),
                ),
                ...List.generate(5, (index) => ListTile(
                  title: Text('选项 ${index + 1}'),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('选择了选项 ${index + 1}')),
                    );
                  },
                )),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 新增方法：构建演示区块标题
  Widget _buildDemoSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDemoItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}