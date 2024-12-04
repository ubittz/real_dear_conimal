import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../const/colors.dart';
import '../const/text_styles.dart';
import '../layout/default_layout.dart';

const Map<int, String> NAV_INDEX_ENDPOINT_MAPPER = {
  0: '/home',
  1: '/product',
  2: '/my_pet',
  3: '/care',
  4: '/profile',
};

class ScaffoldWithNav extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNav({
    super.key,
    required this.navigationShell,
  });

  @override
  State<ScaffoldWithNav> createState() => _ScaffoldWithNavState();
}

class _ScaffoldWithNavState extends State<ScaffoldWithNav> {
  int currentIndex = 0;

  void onTapBottomNavigation(int index) {
    HapticFeedback.heavyImpact();

    final hasAlreadyOnBranch = index == widget.navigationShell.currentIndex;
    if (hasAlreadyOnBranch) {
      context.go(NAV_INDEX_ENDPOINT_MAPPER[index]!);
    } else {
      widget.navigationShell.goBranch(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    _initNavigationIndex(context);

    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 20.0,
        backgroundColor: MyColor.grayScale000,
        selectedItemColor: MyColor.main400,
        selectedLabelStyle: MyTextStyle.caption12R,
        unselectedItemColor: MyColor.grayScale200,
        unselectedLabelStyle: MyTextStyle.caption12R,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTapBottomNavigation,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: PhosphorIcon(
                PhosphorIcons.houseSimple(),
                size: 30.0,
              ),
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: PhosphorIcon(
                PhosphorIcons.bone(),
                size: 30.0,
              ),
            ),
            label: '쇼핑',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: PhosphorIcon(
                PhosphorIcons.pawPrint(),
                size: 30.0,
              ),
            ),
            label: '마이펫',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: PhosphorIcon(
                PhosphorIcons.bathtub(),
                size: 30.0,
              ),
            ),
            label: '케어',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: PhosphorIcon(
                PhosphorIcons.dotsThreeOutline(),
                size: 30.0,
              ),
            ),
            label: '마이',
          ),
        ],
      ),
      child: widget.navigationShell,
    );
  }

  void _initNavigationIndex(BuildContext context) {
    final routerState = GoRouterState.of(context);
    late int index;
    for (final entry in NAV_INDEX_ENDPOINT_MAPPER.entries) {
      if (routerState.fullPath!.startsWith(entry.value)) {
        index = entry.key;
      }
    }
    setState(() => currentIndex = index);
  }
}
