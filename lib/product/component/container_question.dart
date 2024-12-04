import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/dummy.dart';
import '../../common/const/text_styles.dart';
import '../model/question_model.dart';

class ContainerQuestion extends StatelessWidget {
  const ContainerQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuestionModel> questions = questionData
        .map((data) => QuestionModel(
              writer: data[0],
              status: data[1],
              question: data[2],
              questionDate: data[3],
              answer: data[4],
              answerDate: data[5],
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '문의',
          style: MyTextStyle.title24EB,
        ),
        const SizedBox(height: 20.0),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final question = questions[index];

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
                          question.writer,
                          style: MyTextStyle.subtitle14B.copyWith(
                            color: MyColor.grayScale800,
                          ),
                        ),
                        Text(
                          question.status,
                          style: MyTextStyle.caption12R.copyWith(
                            color: question.status == "답변완료"
                                ? MyColor.main400
                                : MyColor.grayScale400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Q. ",
                          style: MyTextStyle.body14R.copyWith(
                            color: MyColor.grayScale700,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                question.question,
                                style: MyTextStyle.body14R.copyWith(
                                  color: MyColor.grayScale700,
                                ),
                              ),
                              Text(
                                question.questionDate,
                                style: MyTextStyle.caption12R.copyWith(
                                  color: MyColor.grayScale400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (question.status == "답변완료") const SizedBox(height: 20.0),
                    if (question.status == "답변완료")
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "A. ",
                            style: MyTextStyle.body14R.copyWith(
                              color: MyColor.grayScale700,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  question.answer,
                                  style: MyTextStyle.body14R.copyWith(
                                    color: MyColor.grayScale700,
                                  ),
                                ),
                                Text(
                                  question.answerDate,
                                  style: MyTextStyle.caption12R.copyWith(
                                    color: MyColor.grayScale400,
                                  ),
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
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 16.0);
          },
          itemCount: questions.length,
        ),
      ],
    );
  }
}
