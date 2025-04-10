import 'package:auv_ui_core/auv_ui_core/auv_colors.dart';
import 'package:auv_ui_core/auv_ui_core/auv_image.dart';
import 'package:auv_ui_core/auv_ui_core/auv_img_text.dart';
import 'package:auv_ui_core/auv_ui_core/auv_space.dart';
import 'package:auv_ui_core/auv_ui_core/auv_text_styles.dart';
import 'package:auv_ui_core/auv_ui_core/auv_widget_enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auv_ui_core/auv_ui_core/auv_box.dart';
import 'package:auv_ui_core/auv_ui_core/auv_gaps.dart';
import 'package:auv_ui_core/auv_ui_core/auv_text.dart';
import 'package:auv_ui_core/auv_ui_core/auv_button.dart';

/// 商品卡片组件
/// 用于展示商品信息，支持以下功能：
/// 1. 主要商品数量展示
/// 2. 折扣标签
/// 3. 赠送商品展示
/// 4. 额外奖励图标展示
/// 5. 价格显示（原价和现价）
class AuvProductCard extends StatelessWidget {
  /// 主商品数量
  final String mainAmount;

  /// 主商品图标
  final String mainIcon;

  /// 主商品单位
  final String? mainUnit;

  /// 折扣标签文本（例如：15% Off）
  final String? discountLabel;

  /// 赠送数量
  final String? bonusAmount;

  /// 赠送商品图标
  final String? bonusIcon;

  /// 额外奖励图标列表
  final List<RewardItem>? rewards;

  /// 现价
  final String currentPrice;

  /// 原价
  final String? originalPrice;

  /// 点击回调
  final VoidCallback? onTap;

  /// 背景颜色
  final Color? backgroundColor;

  /// 卡片圆角
  final double? borderRadius;

  const AuvProductCard({
    super.key,
    required this.mainAmount,
    required this.mainIcon,
    required this.currentPrice,
    this.mainUnit,
    this.discountLabel,
    this.bonusAmount,
    this.bonusIcon,
    this.rewards,
    this.originalPrice,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          AuvBox()
              .p4()
              .color(backgroundColor ?? Colors.white)
              .borderRadius(borderRadius ?? 16.r)
              .elevation(2)
              .shadowColor(Colors.black.withOpacity(0.05))
              .build(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (discountLabel != null) AuvGaps.vGap24,
                    // 主商品信息
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 主商品图标
                        AuvImage.complex(url: mainIcon, width: 48.w, height: 48.w, fit: BoxFit.cover, borderRadius: BorderRadius.circular(8.r)),
                        AuvGaps.hGap12,
                        // 右侧数量信息
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 主商品数量
                              Column(
                                children: [
                                  AuvText(mainAmount).body().build(),
                                  if (mainUnit != null) ...[
                                    AuvGaps.hGap4,
                                    AuvText(mainUnit!).style(AuvTextStyles.caption2_M_60).build(),
                                  ],
                                ],
                              ),
                              // 赠送商品信息
                              if (bonusAmount != null && bonusIcon != null) ...[
                                AuvGaps.vGap8,
                                AuvImgText()
                                    .size(AuvWidgetSize.mini)
                                    .textColor(Colors.purple)
                                    .backgroundColor(Colors.purple.withOpacity(0.1))
                                    .borderRadiusAll(100)
                                    .padding(EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h))
                                    .build(bonusIcon!, '+$bonusAmount')
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),

                    // 额外奖励图标
                    if (rewards != null && rewards!.isNotEmpty) ...[
                      AuvGaps.vGap12,
                      Row(
                        children: [
                          for (var reward in rewards!) ...[
                            AuvImgText().size(AuvWidgetSize.tiny).backgroundColor(AuvColors.black_20p).build(reward.icon, reward.amount ?? ''),
                            AuvGaps.hGap8,
                          ],
                        ],
                      ),
                    ],

                    AuvGaps.vGap16,

                    AuvButton().m12().height(44.w).width(double.infinity).primary().radius(18.w).click(() {
                      print('点击');
                    }).build(Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuvText("USD 1.99").style(AuvTextStyles.w_body2_M).build(),
                        AuvGaps.vGap1,
                        AuvText("USD 19.99").style(AuvTextStyles.w_caption_R_80).strikethrough().build(),
                      ],
                    )),

                    // ///原始写法
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //       height: 44,
                    //       width: double.infinity,
                    //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: AuvColors.primary),
                    //       margin: EdgeInsets.symmetric(horizontal: 12.w),
                    //       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //         Text("data", style: AuvTextStyles.w_caption_B),
                    //         Text("data", style: AuvTextStyles.w_caption2_B_80),
                    //       ])),
                    // ),

                    // // 价格信息
                    // AuvGaps.vGap16,
                    // AuvButton().type(AuvWidgetType.primary).backgroundColor(Colors.black).circle().height(44).build(
                    //       Column(
                    //         children: [
                    //           AuvText(currentPrice).style(AuvTextStyles.w_body2_B).build(),
                    //           if (originalPrice != null) ...[
                    //             AuvText(originalPrice!).style(AuvTextStyles.w_caption2_B_80).strikethrough().build(),
                    //           ],
                    //         ],
                    //       ),
                    //     ),
                  ],
                ),
              ),

          // 折扣标签
          if (discountLabel != null)
            Positioned(
              left: 0,
              top: 0,
              child: Transform.translate(
                offset: Offset(16.w, -4.h),
                child: AuvImgText()
                    .backgroundColor(Colors.yellow)
                    .textColor(Colors.black87)
                    .textStyle(TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ))
                    .borderRadiusAll(100)
                    .padding(EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h))
                    .build(null, discountLabel!),
              ),
            ),
        ],
      ),
    );
  }
}

/// 奖励项数据模型
class RewardItem {
  final String icon;
  final String? amount;

  const RewardItem({
    required this.icon,
    this.amount,
  });
}
