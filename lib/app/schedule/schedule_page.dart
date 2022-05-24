import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/app/schedule/data/schedule_providers.dart';
import 'package:superservice_tpu/app/schedule/widgets/schedule_empty_item.dart';
import 'package:superservice_tpu/app/schedule/widgets/schedule_item.dart';
import 'package:superservice_tpu/entities/schedule/SchedulePosition.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final _schedule = ref.watch(scheduleProvider);

    List<Widget> _getSchedule() {
      List<Widget> schedule = [];
      int _position = 1;

      /// добавление окон
      for (var item in _schedule) {
        if (item.position.position > _position) {
          while (item.position.position > _position) {
            schedule.add(ScheduleEmptyItem(position: new SchedulePosition(position: _position)));
            _position++;
          }
        }
        schedule.add(ScheduleItemCard(scheduleItem: item));
        _position = item.position.position + 1;
      }

      return schedule;
    }

    return SafeArea(
      child: ListView(
        children: _getSchedule(),
      ),
    );
  }
}
