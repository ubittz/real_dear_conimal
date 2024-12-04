import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_dear_conimal/common/const/image_path.dart';

import '../../common/const/dummy.dart';
import '../../common/utils/data_utils.dart';
import '../model/care_model.dart';

final careDetailProvider = Provider.family<CareModel, String>((ref, id) {
  final care =
      ref.watch(careProvider).firstWhere((element) => element.id == id);
  return care;
});

final careProvider =
    StateNotifierProvider<CareStateNotifier, List<CareModel>>((ref) {
  return CareStateNotifier();
});

class CareStateNotifier extends StateNotifier<List<CareModel>> {
  CareStateNotifier() : super([]) {
    state = getItems();
  }

  void updateLike({
    required String careId,
    required bool isLike,
  }) {
    state = state.map((element) {
      if (element.id == careId) {
        return element.copyWith(isLike: isLike);
      } else {
        return element;
      }
    }).toList();
  }

  List<CareModel> getItems() {
    print(careData.length);
    print(careTagData.length);
    return List.generate(
      careData.length,
      (index) {
        return CareModel(
          id: index.toString(),
          manufacturer: careData.values.elementAt(index),
          name: careData.keys.elementAt(index),
          price: 0,
          mainImageUrl: '${ImagePath.careDirectory}$index.png',
          detailImageUrls: [
            '${ImagePath.careDirectory}$index.png',
            '${ImagePath.careDirectory}$index.png',
          ],
          tags: [
            careTagData.elementAt(index * 2),
            careTagData.elementAt(index * 2 + 1),
          ],
          reviewAverage: DataUtils.getRandomDouble(min: 4.5, range: 0.5)
              .toStringAsFixed(1),
          reviewCount: DataUtils.getRandomInt(dividerNumber: 100),
          isLike: true,
          likeCount: DataUtils.getRandomInt(dividerNumber: 100),
        );
      },
    );
  }
}
