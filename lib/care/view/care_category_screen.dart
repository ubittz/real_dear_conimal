import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_dear_conimal/care/model/care_model.dart';

import '../../common/component/button/custom_ink_well_button.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../component/care_vertical_item_grid.dart';
import '../model/enum/care_category_type.dart';
import '../provider/care_category_provider.dart';
import '../provider/care_provider.dart';

class CareCategoryScreen extends ConsumerWidget {
  static String get routeName => 'care_category';

  const CareCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cares = ref.watch(careProvider);
    final selectedCareCategoryType =
        ref.watch(selectedCareCategoryTypeProvider);

    late List<CareModel> renderCares;

    if (selectedCareCategoryType == CareCategoryType.hospital) {
      renderCares = cares.sublist(0, 7);
    } else if (selectedCareCategoryType == CareCategoryType.hotel) {
      renderCares = cares.sublist(14, 21);
    } else {
      renderCares = cares.sublist(21, 28);
    }

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: Column(
        children: [
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInkWellButton(
                title: CareCategoryType.hospital.label,
                onTap: () {
                  ref.read(selectedCareCategoryTypeProvider.notifier).state =
                      CareCategoryType.hospital;
                },
                isSelected:
                    selectedCareCategoryType == CareCategoryType.hospital,
              ),
              const SizedBox(width: 8.0),
              CustomInkWellButton(
                title: CareCategoryType.hotel.label,
                onTap: () {
                  ref.read(selectedCareCategoryTypeProvider.notifier).state =
                      CareCategoryType.hotel;
                },
                isSelected: selectedCareCategoryType == CareCategoryType.hotel,
              ),
              const SizedBox(width: 8.0),
              CustomInkWellButton(
                title: CareCategoryType.beauty.label,
                onTap: () {
                  ref.read(selectedCareCategoryTypeProvider.notifier).state =
                      CareCategoryType.beauty;
                },
                isSelected: selectedCareCategoryType == CareCategoryType.beauty,
              ),
            ],
          ),
          Expanded(
            child: CareVerticalItemList(cares: renderCares),
          ),
        ],
      ),
    );
  }
}
