import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../model/care_model.dart';
import '../view/care_detail_screen.dart';

class CareVerticalItemList extends ConsumerWidget {
  final List<CareModel> cares;

  const CareVerticalItemList({
    super.key,
    required this.cares,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double itemSpacing = 20.0;
    const double horizontalPadding = 20.0;
    final double itemWidth = (MediaQuery.of(context).size.width -
            (horizontalPadding * 2) -
            itemSpacing) /
        2;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: horizontalPadding,
      ),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: itemSpacing,
        crossAxisSpacing: itemSpacing,
        childAspectRatio: itemWidth / (itemWidth + 140), // / 1,
      ),
      itemCount: cares.length,
      itemBuilder: (context, index) {
        final care = cares[index];

        return GestureDetector(
          onTap: () {
            context.goNamed(
              CareDetailScreen.routeName,
              pathParameters: {'id': care.id.toString()},
            );
          },
          child: SizedBox(
            width: itemWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: MyColor.grayScale100,
                      width: 1.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      care.mainImageUrl,
                      fit: BoxFit.cover,
                      height: itemWidth,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  care.manufacturer,
                  style: MyTextStyle.caption12R.copyWith(
                    color: MyColor.grayScale400,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  care.name,
                  style: MyTextStyle.subtitle14B,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),
                Text(
                  care.tags.join(' '),
                  style: MyTextStyle.caption12R.copyWith(
                    color: MyColor.grayScale400,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Row(
                      children: [
                        PhosphorIcon(
                          PhosphorIcons.star(),
                          color: MyColor.star,
                          size: 16.0,
                        ),
                        const SizedBox(width: 2.0),
                        Text(
                          '${care.reviewAverage}점',
                          style: MyTextStyle.caption12R.copyWith(
                            color: MyColor.grayScale400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12.0),
                    Row(
                      children: [
                        PhosphorIcon(
                          PhosphorIcons.chatCentered(),
                          size: 16.0,
                        ),
                        const SizedBox(width: 2.0),
                        Text(
                          '${care.reviewCount}개의 리뷰',
                          style: MyTextStyle.caption12R.copyWith(
                            color: MyColor.grayScale400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
