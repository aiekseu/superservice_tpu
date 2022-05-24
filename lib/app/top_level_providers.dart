import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/services/enums.dart';

final userGroupProvider = Provider<String>((ref) {
  return '8К81';
});

final activePage = StateProvider<Pages>((ref) => Pages.allServices);