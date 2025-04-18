import 'package:auv_ui_core/auv_ui_core/auv_gaps.dart';
import 'package:auv_ui_core/auv_ui_core/divider_demo.dart';
import 'package:auv_ui_core/demo/auv_text_styles_demo.dart';
import 'package:auv_ui_core/demo/app_bar_demo.dart';
import 'package:auv_ui_core/demo/box_demo.dart';
import 'package:auv_ui_core/demo/button_demo.dart';
import 'package:auv_ui_core/demo/colors_demo.dart';
import 'package:auv_ui_core/demo/dimens_demo.dart';
import 'package:auv_ui_core/demo/gaps_demo.dart';
import 'package:auv_ui_core/demo/icon_demo.dart';
import 'package:auv_ui_core/demo/image_loader_demo.dart';
import 'package:auv_ui_core/demo/product_card_demo.dart';
import 'package:auv_ui_core/demo/test_page.dart';
import 'package:flutter/material.dart';
import 'package:auv_ui_core/auv_ui_core/auv_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auv_ui_core/demo/space_demo.dart';
import 'package:auv_ui_core/demo/img_text_demo.dart';
import 'package:auv_ui_core/demo/tag_selector_demo.dart';
import 'package:auv_ui_core/demo/dialog_demo.dart';
import 'demo/auv_text_demo.dart';

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
          home: MediaQuery(
            ///设置文字大小不随系统设置改变
            ///ScreenUtil().screenWidth / AuvConst.AUV_SCREEN_DESIGN_WIDTH
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: const DemoHomePage(),
          ),
        );
      },
    );
  }
}

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  Widget _buildDemoItem(BuildContext context, String title, IconData icon, Widget page) {
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
          _buildDemoItem(context, 'Dimens 演示', Icons.straighten_outlined, const DimensDemoApp()),
          _buildDemoItem(context, 'Gaps 演示', Icons.space_bar, const GapsDemoApp()),
          _buildDemoItem(context, 'Space 演示', Icons.space_dashboard, const SpaceDemoApp()),
          _buildDemoItem(context, 'AuvBox 演示', Icons.widgets_outlined, const BoxDemoApp()),
          _buildDemoItem(context, 'Colors 演示', Icons.color_lens_outlined, const ColorsDemoApp()),
          _buildDemoItem(context, 'AuvButton 演示', Icons.touch_app_outlined, const ButtonDemoApp()),
          _buildDemoItem(context, 'ImgText 演示', Icons.image, const ImgTextDemoApp()),
          _buildDemoItem(context, 'TagSelector 演示', Icons.label_important, const TagSelectorDemoApp()),
          _buildDemoItem(context, 'Dialog 演示', Icons.message, const DialogDemoApp()),
          _buildDemoItem(context, 'AppBar 演示', Icons.view_headline, const AppBarDemoPage()),
          _buildDemoItem(context, 'Image Loader 演示', Icons.album, const ImageLoaderDemoApp()),
          _buildDemoItem(context, 'Icon 演示', Icons.album, const IconDemoApp()),
          _buildDemoItem(context, '文字样式 演示', Icons.album, const AuvTextStylesDemo()),
          _buildDemoItem(context, 'AuvText 演示', Icons.text_fields, const AuvTextDemoApp()),
          _buildDemoItem(context, '线条 演示', Icons.album, const DividerDemoPage()),
          _buildDemoItem(context, '商品组件 演示', Icons.album, const ProductCardDemo()),
          _buildDemoItem(context, '组合展示 演示', Icons.album, const TestPage()),
        ],
      ),
    );
  }
}
