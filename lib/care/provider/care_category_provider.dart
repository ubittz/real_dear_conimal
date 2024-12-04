import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_dear_conimal/care/model/enum/care_category_type.dart';

final selectedCareCategoryTypeProvider = StateProvider<CareCategoryType>(
  (ref) => CareCategoryType.hospital,
);
