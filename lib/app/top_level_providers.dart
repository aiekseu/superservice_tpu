import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/services/date_time.dart';

final currentDateProvider = StateProvider<MyDateTime>((ref) {
  return MyDateTime(DateTime.now());
});

final userGroupProvider = Provider<String>((ref) {
  return '8К81';
});
