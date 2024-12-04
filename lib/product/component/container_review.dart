import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/dummy.dart';
import '../../common/const/text_styles.dart';
import '../model/review_model.dart';

class ContainerReview extends StatelessWidget {
  const ContainerReview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReviewModel> reviews = reviewData
        .map((e) => ReviewModel(id: e[0], date: e[1], content: e[2]))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '리뷰',
          style: MyTextStyle.title24EB,
        ),
        const SizedBox(height: 20.0),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final review = reviews[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: MyColor.grayScale050,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          review.id,
                          style: MyTextStyle.subtitle14B.copyWith(
                            color: MyColor.grayScale800,
                          ),
                        ),
                        Text(
                          review.date,
                          style: MyTextStyle.caption12R.copyWith(
                            color: MyColor.grayScale400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                        children: List.generate(
                      5,
                      (int index) => const Icon(
                        Icons.star,
                        color: MyColor.star,
                        size: 14.0,
                      ),
                    )),
                    const SizedBox(height: 8.0),
                    Text(
                      review.content,
                      style: MyTextStyle.body14R.copyWith(
                        color: MyColor.grayScale700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 16.0);
          },
          itemCount: reviews.length,
        ),
      ],
    );
  }
}
