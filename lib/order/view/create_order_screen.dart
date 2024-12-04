import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/product_cart/provider/product_cart_provider.dart';

import '../../common/component/button/radio_button.dart';
import '../../common/component/divider/divider_container.dart';
import '../../common/component/drop_down/custom_drop_down_single.dart';
import '../../common/component/text_form_filed/custom_label_text_form_field.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/view/completion_screen.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_provider.dart';
import '../component/delivery_info.dart';
import '../component/order_info.dart';
import '../component/product_info.dart';
import '../provider/order_provider.dart';

class CreateOrderScreen extends ConsumerStatefulWidget {
  static String get routeName => 'create_order';

  const CreateOrderScreen({super.key});

  @override
  ConsumerState<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends ConsumerState<CreateOrderScreen> {
  bool isLoading = false;
  int productPrice = 0;
  int totalPrice = 0;

  String cardName = ''; // 카드사 이름
  bool isSelectedPaymentMethod = true;

  @override
  Widget build(BuildContext context) {
    final carts = ref.watch(selectedProductCartProvider);
    final user = ref.watch(userProvider) as UserModel;

    // price
    if (carts.isNotEmpty) {
      productPrice = carts
          .map((e) => e.product.price * e.amount)
          .reduce((value, element) => value + element);

      totalPrice = carts
          .map((e) => e.product.price * e.amount)
          .reduce((value, element) => value + element)
          .toInt();
    } else {
      productPrice = 0;
      totalPrice = 0;
    }

    // final discountPrice = carts
    //     .map((e) => (e.product.price * e.product.sale / 100) * e.amount)
    //     .reduce((value, element) => value + element).toInt();
    final discountPrice = productPrice - totalPrice;

    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '주문/결제'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductInfo(carts: carts),
            const DividerContainer(),
            OrderInfo(
              user: user,
              productPrice: productPrice,
              discountPrice: discountPrice,
              totalPrice: totalPrice,
            ),
            const DividerContainer(),
            DeliveryInfo(address: user.address),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '결제 정보',
                    style: MyTextStyle.title24EB,
                  ),
                  const SizedBox(height: 8.0),
                  // 가상계좌 선택
                  RadioButton(
                    title: '가상 계좌',
                    onTap: () {
                      setState(() {
                        isSelectedPaymentMethod = !isSelectedPaymentMethod;
                      });
                    },
                    isSelected: !isSelectedPaymentMethod,
                  ),
                  if (!isSelectedPaymentMethod)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '은행명',
                          style: MyTextStyle.body14R.copyWith(
                            color: MyColor.grayScale600,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        CustomSingleDropDown(
                          dropdownList: [
                            "KB국민은행",
                            "우리은행",
                            "SC제일은행",
                            "한국씨티은행",
                            "iM뱅크",
                            "하나은행",
                            "신한은행",
                            "케이뱅크",
                            "카카오뱅크",
                            "토스뱅크",
                          ],
                          hintText: "은행명을 입력해 주세요.",
                          onChanged: (String value) {
                            print(value);
                          },
                          dropdownHeight: 240,
                        ),
                        const SizedBox(height: 12.0),
                        CustomLabelTextFormField(
                          title: '입금자명',
                          hintText: '입금자명을 입력해 주세요.',
                          onChanged: (String value) {
                            print(value);
                          },
                          onSaved: (String? newValue) {},
                          validator: (String? value) {
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          '가상 계좌 유효 기간 2024년 06월 24일 11:06',
                          style: MyTextStyle.subtitle14B.copyWith(
                            color: MyColor.grayScale700,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '가상계좌 입금 주의사항\n- 가상계좌 주문 방식은 입금 최종 완료 후 주문확인 및 출고가 진행됩니다.\n- 가상계좌 입금 전 재고 소전, 상품 품저르 판매 종료 등의 사유가 발생될 경우 주문이 취소됩니다.\n- 가상계좌는 주문 시 고객님께 발급되는 일회성 계좌번호 이므로 입금자명을 동일하게 처리해주셔야 합니다.',
                          style: MyTextStyle.caption12R
                              .copyWith(color: MyColor.grayScale400),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),

                  const Divider(color: MyColor.grayScale050),

                  // 카드결제 선택
                  RadioButton(
                    title: '카드 결제',
                    onTap: () {
                      setState(() {
                        isSelectedPaymentMethod = !isSelectedPaymentMethod;
                      });
                    },
                    isSelected: isSelectedPaymentMethod,
                  ),
                  if (isSelectedPaymentMethod)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '카드사',
                          style: MyTextStyle.body14R.copyWith(
                            color: MyColor.grayScale600,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        CustomSingleDropDown(
                          dropdownList: const [
                            '국민카드',
                            '현대카드',
                            '삼성카드',
                            '롯데카드',
                            '비씨카드',
                            '하나카드',
                          ],
                          hintText: "카드사를 선택해 주세요.",
                          onChanged: (String value) {
                            print(value);
                          },
                          dropdownHeight: 240,
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          '할부',
                          style: MyTextStyle.body14R.copyWith(
                            color: MyColor.grayScale600,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        CustomSingleDropDown(
                          dropdownList: const [
                            "1개월(무이자)",
                            "2개월(무이자)",
                            "3개월(무이자)",
                            "4개월",
                            "5개월",
                            "6개월",
                            "7개월",
                            "8개월",
                            "9개월",
                            "10개월",
                            "11개월",
                            "12개월",
                          ],
                          hintText: "할부를 선택해 주세요.",
                          onChanged: (String value) {
                            print(value);
                          },
                          dropdownHeight: 240,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SolidButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    isLoading = false;
                  });

                  // 주문/결제하기
                  ref.read(orderProvider.notifier).orderFromCarts(
                        carts: carts,
                        user: user,
                        cardName: cardName,
                        totalPrice: totalPrice,
                      );
                  ref
                      .read(productCartProvider.notifier)
                      .removeAllSelectedProduct();

                  context.goNamed(
                    CompletionScreen.routeName,
                    pathParameters: {'title': '결제가\n정상적으로\n완료되었습니다.'},
                  );
                },
                child: const Text('결제하기'),
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
