import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superservice_tpu/app/schedule/data/mocks.dart';
import 'package:superservice_tpu/entities/schedule/ScheduleItem.dart';

final pickedDateProvider = StateProvider<DateTime>((ref) {
  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day);
  return date;
});

final bannedSubjectsProvider = FutureProvider<List<String>>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final ids = prefs.getStringList('bannedSubjects') ?? [];

  return ids;
});

final bannedHashesProvider = Provider<List<String>>((ref) {
  var hashes = <String>[];
  SharedPreferences.getInstance()
      .then((value) => {hashes = value.getStringList('bannedHashes') ?? <String>[]});

  return hashes;
});

final scheduleProvider = Provider<List<ScheduleItem>>((ref) {
  final pickedDate = ref.watch(pickedDateProvider);
  final bannedSubjects = ref.watch(bannedSubjectsProvider);
  final bannedHashes = ref.watch(bannedHashesProvider);
  final List<ScheduleItem> schedule = [];

  for (var item in mockSchedule) {
    /// если выбранный день
    if (item.date.month == pickedDate.month && item.date.day == pickedDate.day) {
      /// если конкретная пара "забанена"
      if (bannedHashes.contains(item.hashCode.toString())) {
        item.isHidden = true;
      }
        schedule.add(item);
    }
  }

  schedule.sort((a, b) => a.position.position.compareTo(b.position.position));
  return schedule;
});
