import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAutoLoginProvider = StateProvider<bool>(
  (ref) => true,
);

final searchKeywordProvider = StateProvider<String>(
  (ref) => '',
);
