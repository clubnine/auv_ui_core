import 'package:auv_core/auv_ui_core/auv_product_card.dart';
import 'package:auv_core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardDemo extends StatelessWidget {
  const ProductCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品卡片演示'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              children: [
                // 基础卡片
                SizedBox(
                  width: 164.w,
                  child: AuvProductCard(
                    mainAmount: '14000',
                    mainIcon: 'D'.fakeImg(),
                    mainUnit: 'Diamonds',
                    currentPrice: 'USD 1.99',
                  ),
                ),

                // 带折扣和赠送的卡片
                SizedBox(
                  width: 164.w,
                  child: AuvProductCard(
                    mainAmount: '28000',
                    mainIcon: 'D'.fakeImg(),
                    discountLabel: '15% Off',
                    bonusAmount: '2500',
                    bonusIcon: 'D'.fakeImg(),
                    currentPrice: 'USD 1.99',
                    originalPrice: 'USD 19.99',
                    rewards: [
                      RewardItem(
                        icon: 'C'.fakeImg(),
                        amount: 'x3',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                // 带多个奖励的卡片
                SizedBox(
                  width: 164.w,
                  child: AuvProductCard(
                    mainAmount: '42000',
                    mainIcon: 'D'.fakeImg(),
                    discountLabel: '20% Off',
                    bonusAmount: '2500',
                    bonusIcon: 'D'.fakeImg(),
                    currentPrice: 'USD 1.99',
                    originalPrice: 'USD 19.99',
                    rewards: [
                      RewardItem(
                        icon: 'C'.fakeImg(),
                        amount: 'x3',
                      ),
                      RewardItem(
                        icon: 'H'.fakeImg(),
                        amount: 'x3',
                      ),
                    ],
                  ),
                ),

                // 带更多奖励的卡片
                SizedBox(
                  width: 164.w,
                  child: AuvProductCard(
                    mainAmount: '56000',
                    mainIcon: 'D'.fakeImg(),
                    discountLabel: '25% Off',
                    bonusAmount: '2500',
                    bonusIcon: 'D'.fakeImg(),
                    currentPrice: 'USD 1.99',
                    originalPrice: 'USD 19.99',
                    rewards: [
                      RewardItem(
                        icon: 'P'.fakeImg(),
                        amount: '1',
                      ),
                      RewardItem(
                        icon: 'C'.fakeImg(),
                        amount: 'x2',
                      ),
                      RewardItem(
                        icon: 'H'.fakeImg(),
                        amount: 'x3',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
