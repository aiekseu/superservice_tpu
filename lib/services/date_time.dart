import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDateTime{
  MyDateTime(DateTime datetime) {
    pickedDay = datetime;
    thisWeek[0] = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    thisWeek[1] = thisWeek[0]!.add(Duration(days: 1));
    thisWeek[2] = thisWeek[0]!.add(Duration(days: 2));
    thisWeek[3] = thisWeek[0]!.add(Duration(days: 3));
    thisWeek[4] = thisWeek[0]!.add(Duration(days: 4));
    thisWeek[5] = thisWeek[0]!.add(Duration(days: 5));
    thisWeek[6] = thisWeek[0]!.add(Duration(days: 6));
  }

  final Map<int, String> weekdays = {
    0 : 'воскресенье',
    1 : 'понедельник',
    2 : 'вторник',
    3 : 'среда',
    4 : 'четверг',
    5 : 'пятница',
    6 : 'суббота',
  };
  final Map<int, String> shortWeekdaysFromMonday = {
    0 : 'пн',
    1 : 'вт',
    2 : 'ср',
    3 : 'чт',
    4 : 'пт',
    5 : 'сб',
    6 : 'вс',
  };
  final Map<int, String> months = {
    1 : 'января',
    2 : 'февраля',
    3 : 'марта',
    4 : 'апреля',
    5 : 'мая',
    6 : 'июня',
    7 : 'июля',
    8 : 'августа',
    9 : 'сентября',
    10 : 'октября',
    11 : 'ноября',
    12 : 'декабря',
  };

  DateTime pickedDay = DateTime.now();
  DateTime today = DateTime.now();
  Map<int, DateTime> thisWeek = {};

  String getToday() {
    return '${pickedDay.day} ${months[pickedDay.month]}, ${getEvenness()}';
  }

  bool isEven() {
    final int weeksAfterNewYear = pickedDay.difference(DateTime(DateTime.now().year)).inDays~/7;
    return (weeksAfterNewYear % 2 == 0);
  }

  String getEvenness() {
    if (isEven()) return 'четная';
    return 'нечетная';
  }

  void pickNewDay(int weekday) {
    pickedDay = thisWeek[weekday]!;
  }
}