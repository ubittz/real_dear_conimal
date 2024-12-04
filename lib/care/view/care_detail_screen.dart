import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/care/view/care_reservation_screen.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/product/component/container_review.dart';

import '../../common/component/divider/divider_container.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../product/component/container_question.dart';
import '../component/care_horizontal_item_list.dart';
import '../model/care_model.dart';
import '../provider/care_provider.dart';

class CareDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'care_detail';

  final String id;

  const CareDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<CareDetailScreen> createState() =>
      _CareDetailDetailScreenState();
}

class _CareDetailDetailScreenState extends ConsumerState<CareDetailScreen> {
  final ScrollController scrollController = ScrollController();
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final care = ref.watch(careDetailProvider(widget.id));

    final fullWidth = MediaQuery.of(context).size.width;
    final safeTopPadding = MediaQuery.of(context).padding.top;

    final carePrefers = ref.watch(careProvider);

    return DefaultLayout(
      appbar: Hidable(
        preferredWidgetSize:
            Size.fromHeight(DefaultAppBar.defaultAppBarHeight + safeTopPadding),
        controller: scrollController,
        child: const DefaultAppBar(title: ''),
      ),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        preferredWidgetSize: const Size.fromHeight(68),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  ref.read(careProvider.notifier).updateLike(
                        careId: care.id,
                        isLike: !care.isLike,
                      );
                },
                icon: care.isLike
                    ? PhosphorIcon(
                        PhosphorIcons.heart(PhosphorIconsStyle.fill),
                        color: MyColor.error,
                        size: 32.0,
                      )
                    : PhosphorIcon(
                        PhosphorIcons.heart(),
                        color: MyColor.grayScale400,
                        size: 32.0,
                      ),
              ),
              const SizedBox(width: 8.0),
              const SizedBox(width: 8.0),
              Expanded(
                child: SolidButton(
                  onPressed: () {
                    context.goNamed(
                      CareCreateReservationScreen.routeName,
                      pathParameters: {'id': care.id},
                    );
                  },
                  child: const Text('예약하기'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              care.mainImageUrl,
              width: fullWidth,
              height: fullWidth,
              fit: BoxFit.fitWidth,
            ),
            renderCareInfo(care: care),
            const DividerContainer(),
            renderDescriptionImages(detailImages: care.detailImageUrls.first),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('이용안내', style: MyTextStyle.title24EB),
                  const SizedBox(height: 20.0),
                  Text(
                    '''- 결제완료 후 취소나 변경이 어려운 상품의 경우 상품페이지 내에 공지되어있으니 참고하여 구매 부탁드립니다.\n\n※ 디어코니멀은 전자결제서비스제공자 및 통신판매중개자이며 통신판매의 당사자가 아닙니다. 상품, 상품정보 및 거래에 관한 의무와 책임은 판매자에게 있습니다.''',
                    style: MyTextStyle.body14R.copyWith(
                      color: MyColor.grayScale300,
                    ),
                  ),
                ],
              ),
            ),
            const DividerContainer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: ContainerReview(),
            ),
            const DividerContainer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: ContainerQuestion(),
            ),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '추천 케어',
                    style: MyTextStyle.title24EB,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '더보기',
                      style: MyTextStyle.body16R.copyWith(
                        color: MyColor.grayScale300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            CareHorizontalItemList(
              cares: carePrefers,
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderCareInfo({
    required CareModel care,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            care.manufacturer,
            style: MyTextStyle.body16R.copyWith(
              color: MyColor.grayScale300,
            ),
          ),
          const SizedBox(width: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  care.name,
                  style: MyTextStyle.title24EB,
                ),
              ),
              const SizedBox(width: 12.0),
              IconButton(
                onPressed: () {
                  ref.read(careProvider.notifier).updateLike(
                        careId: care.id,
                        isLike: !care.isLike,
                      );
                },
                icon: care.isLike
                    ? PhosphorIcon(
                        PhosphorIcons.heart(PhosphorIconsStyle.fill),
                        color: MyColor.redCherry500,
                        size: 32.0,
                      )
                    : PhosphorIcon(
                        PhosphorIcons.heart(),
                        color: MyColor.grayScale400,
                        size: 32.0,
                      ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            '상담 후 결제',
            style: MyTextStyle.subtitle18EB.copyWith(
              color: MyColor.main400,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderDescriptionImages({
    required String detailImages,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '상품 정보',
            style: MyTextStyle.title24EB,
          ),
          const SizedBox(height: 20.0),
          Container(
            color: MyColor.grayScale400,
            child: Image.asset(
              detailImages,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            '''- 에이드 동물병원은 최신 의료장비를 보유하고 내과, 외과, 영상의학과 석/박사 학위의 전문 의료진이 24시간 연중무휴 환자 진료와 케어에 매진하고 있습니다.\n다양한 고난이도 수술 및 시술, 응급 수술이 가능하며 노령성 질환, 난치성 질환도 전문적으로 치료합니다.\n\n- 저희 에이드 동물병원은 '돕다(AID)'라는 의미 그대로 반려동물 환자의 고통을 신속하고 정확하게 헤아리고 보호자의 마음에도 위로가 되는 믿음직한 이웃 같은 병원이 되겠습니다.\n\n- 국제 고양이 의학회(ISFM) 고양이 친화 병원 GOLD 등급 인증을 획득하였으며 고양이 환자의 스트레스를 최소화 하고 보호자가 보다 편히 찾을 수 있는 병원이 되기 위해 노력하겠습니다.\n\n- 또한 반려동물 친구들이 편안하게 이용할 수 있는 미용/스파, 반려견 호텔/놀이방 서비스, 각종 용품과 건강한 먹거리도 구비하고 있습니다.''',
            style: MyTextStyle.body14R.copyWith(color: MyColor.grayScale400),
          )
        ],
      ),
    );
  }
}
