import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/services/date_time.dart';

import '../../top_level_providers.dart';

class PickDay extends ConsumerWidget {
  const PickDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final today = watch(currentDateProvider);

    List<Widget> getList() {
      var _list = <Widget>[];

      for (var i = 0; i < 7; i++) {
        _list.add(
          Expanded(
            child: InkWell(
              onTap: () {
                today.state = MyDateTime(today.state.thisWeek[i]!);
              },
              child: Container(
                decoration: (today.state.today.weekday-1 == i)
                    ? BoxDecoration(
                        color: (today.state.pickedDay.weekday-1 == i)
                            ? Colors.green
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.green, width: 2))
                    : BoxDecoration(
                        color: (today.state.pickedDay.weekday-1 == i)
                            ? Colors.green
                            : Colors.transparent,
                      ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    children: [
                      Text(
                        today.state.thisWeek[i]!.day.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: (today.state.pickedDay.weekday-1 == i)
                                ? Colors.white
                                : Colors.black),
                      ),
                      Text(
                        today.state.shortWeekdaysFromMonday[i]!,
                        style: TextStyle(
                            fontSize: 16,
                            color: (today.state.pickedDay.weekday-1 == i)
                                ? Colors.white
                                : Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return _list;
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              today.state.getToday(),
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getList(),
          ),
        ],
      ),
    );
  }
}
