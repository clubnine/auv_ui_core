import 'package:auv_core/auv_ui_core/auv_gaps.dart';
import 'package:auv_core/demo/app_bar_demo.dart';
import 'package:auv_core/demo/box_demo.dart';
import 'package:auv_core/demo/button_demo.dart';
import 'package:auv_core/demo/colors_demo.dart';
import 'package:auv_core/demo/dimens_demo.dart';
import 'package:auv_core/demo/gaps_demo.dart';
import 'package:auv_core/demo/image_loader_demo.dart';
import 'package:flutter/material.dart';
import 'package:auv_core/auv_ui_core/auv_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auv_core/demo/space_demo.dart';
import 'package:auv_core/demo/img_text_demo.dart';
import 'package:auv_core/demo/tag_selector_demo.dart';
import 'package:auv_core/demo/dialog_demo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainDemoApp());
}

class MainDemoApp extends StatelessWidget {
  const MainDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'AUV Core 演示',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const DemoHomePage(),
        );
      },
    );
  }
}

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  Widget _buildDemoItem(
      BuildContext context, String title, IconData icon, Widget page) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
        ),
        const Divider(height: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AUV Core 演示')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDemoItem(
              context, 'AuvBox 演示', Icons.widgets_outlined, const BoxDemoApp()),
          _buildDemoItem(context, 'AuvButton 演示', Icons.touch_app_outlined,
              const ButtonDemoApp()),
          _buildDemoItem(context, 'Colors 演示', Icons.color_lens_outlined,
              const ColorsDemoApp()),
          _buildDemoItem(context, 'Dimens 演示', Icons.straighten_outlined,
              const DimensDemoApp()),
          _buildDemoItem(
              context, 'Gaps 演示', Icons.space_bar, const GapsDemoApp()),
          _buildDemoItem(
              context, 'Space 演示', Icons.space_dashboard, const SpaceDemoApp()),
          _buildDemoItem(
              context, 'ImgText 演示', Icons.image, const ImgTextDemoApp()),
          _buildDemoItem(context, 'TagSelector 演示', Icons.label_important,
              const TagSelectorDemoApp()),
          _buildDemoItem(
              context, 'Dialog 演示', Icons.message, const DialogDemoApp()),
          _buildDemoItem(context, 'AppBar 演示', Icons.view_headline,
              const AppBarDemoPage()),
          _buildDemoItem(context, 'Image Loader 演示', Icons.album,
              const ImageLoaderDemoApp()),
        ],
      ),
    );
  }
}
