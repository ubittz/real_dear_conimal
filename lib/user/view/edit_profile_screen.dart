import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';

import '../../common/component/modal/show/show_custom_toast.dart';
import '../../common/component/text_form_filed/custom_label_text_form_field.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static String get routeName => "edit_profile";

  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<String> selectedDropdownItems = [];

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    if (user is UserModel) {
      _nameController.text = user.name;
      _usernameController.text = user.username;
      _emailController.text = user.email;
      _passwordController.text = '비밀번호 재설정하기';
    }

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: Container(
            color: MyColor.empty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '내 정보 수정',
                  style: MyTextStyle.title24EB,
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: [
                    const Spacer(),
                    Stack(
                      alignment: Alignment.center,
                      fit: StackFit.loose,
                      children: [
                        Image.asset(
                          ImagePath.user,
                          width: 100.0,
                          height: 100.0,
                        ),
                        Positioned(
                          right: -8.0,
                          bottom: -8.0,
                          child: IconButton(
                            onPressed: () {
                              print('camera');
                            },
                            iconSize: 20.0,
                            icon: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: MyColor.main400,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: PhosphorIcon(PhosphorIcons.plus()),
                              ),
                            ),
                            color: MyColor.grayScale000,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 40.0),
                CustomLabelTextFormField(
                  title: '이름을 입력해 주세요.',
                  controller: _nameController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                CustomLabelTextFormField(
                  title: '아이디',
                  controller: _usernameController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  enabled: false,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '*아이디는 수정이 불가능합니다.',
                  style: MyTextStyle.caption12R.copyWith(
                    color: MyColor.grayScale400,
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomLabelTextFormField(
                  title: '이메일을 입력해 주세요.',
                  controller: _emailController,
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: PhosphorIcon(PhosphorIcons.x()),
                  ),
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20.0),
                CustomLabelTextFormField(
                  title: '비밀번호 재설정',
                  controller: _passwordController,
                  hintText: '비밀번호를 입력해 주세요.',
                  onChanged: (String? value) {},
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: PhosphorIcon(PhosphorIcons.caretRight()),
                  ),
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 40.0),
                SolidButton(
                  onPressed: () {
                    ref.read(userProvider.notifier).updateInfo(
                          name: _nameController.text,
                          password: _passwordController.text,
                          email: _emailController.text,
                        );

                    showCustomToast(context, msg: '저장이 완료되었습니다.');
                    context.pop();
                  },
                  child: const Text('저장하기'),
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
