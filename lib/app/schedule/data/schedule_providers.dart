import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superservice_tpu/app/schedule/data/mocks.dart';
import 'package:superservice_tpu/entities/schedule/ScheduleItem.dart';

/// Выбранная дата
final pickedDateProvider = StateProvider<DateTime>((ref) {
  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day);
  return date;
});

/// local storage
final sharedPrefs = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

/// Запись и получение забаненных id пар
class BannedScheduleItemsIds extends StateNotifier<List<String>> {
  BannedScheduleItemsIds(this.pref)
      : super(pref?.getStringList("bannedIds") ?? []);

  static final provider =
      StateNotifierProvider<BannedScheduleItemsIds, List<String>>((ref) {
    final pref = ref.watch(sharedPrefs).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        );
    return BannedScheduleItemsIds(pref);
  });

  final SharedPreferences? pref;

  void toggle(String bannedId) {
    if (state.contains(bannedId)) {
      state = state.where((id) => id != bannedId).toList();
    } else {
      state = [...state, bannedId];
    }
    print(state);
    // Throw here since for some reason SharedPreferences could not be retrieved
    pref!.setStringList("bannedIds", state);
  }
}


/// Запись и получение забаненных id предметов
class BannedSubjectsIds extends StateNotifier<List<String>> {
  BannedSubjectsIds(this.pref)
      : super(pref?.getStringList("bannedSubjectsIds") ?? []);

  static final provider =
  StateNotifierProvider<BannedSubjectsIds, List<String>>((ref) {
    final pref = ref.watch(sharedPrefs).maybeWhen(
      data: (value) => value,
      orElse: () => null,
    );
    return BannedSubjectsIds(pref);
  });

  final SharedPreferences? pref;

  void toggle(String bannedId) {
    if (state.contains(bannedId)) {
      state = state.where((id) => id != bannedId).toList();
    } else {
      state = [...state, bannedId];
    }
    print(state);
    // Throw here since for some reason SharedPreferences could not be retrieved
    pref!.setStringList("bannedSubjectsIds", state);
  }
}

final scheduleProvider = Provider<List<ScheduleItem>>((ref) {
  final pickedDate = ref.watch(pickedDateProvider);
  final bannedSubjects = ref.watch(BannedSubjectsIds.provider);
  final bannedIds = ref.watch(BannedScheduleItemsIds.provider);
  final List<ScheduleItem> schedule = [];

  for (var item in mockSchedule) {
    /// если выбранный день
    if (item.date.month == pickedDate.month &&
        item.date.day == pickedDate.day) {
      /// если конкретная пара "забанена"
      (bannedIds.contains(item.id) || bannedSubjects.contains(item.subject.id))
        ? item.isHidden = true
        : item.isHidden = false;
      schedule.add(item);
    }
  }

  schedule.sort((a, b) => a.position.position.compareTo(b.position.position));
  return schedule;
});
