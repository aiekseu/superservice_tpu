import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/app/schedule/widgets/day_picker.dart';
import 'package:superservice_tpu/services/date_time.dart';

import '../top_level_providers.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final today = watch(currentDateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Расписание гр. ${watch(userGroupProvider)}'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            PickDay(),
          ],
        ),
      ),
    );
  }
}


