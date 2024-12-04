import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/view/home_screen.dart';
import '../component/button/default_button.dart';
import '../const/colors.dart';
import '../const/text_styles.dart';
import '../layout/default_layout.dart';

class CompletionScreen extends StatelessWidget {
  static String get routeName => 'completion';

  final String title;

  const CompletionScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100.0),
            Text(
              title.split(":").first,
              style: MyTextStyle.title24EB,
            ),
            const SizedBox(height: 20.0),
            if (title.split(":").length == 2)
              Text(
                title.split(":")[1],
                style: MyTextStyle.body16R.copyWith(
                  color: MyColor.main400,
                ),
              ),
            const Spacer(),
            SolidButton(
              onPressed: () {
                context.goNamed(HomeScreen.routeName);
              },
              child: const Text('홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
