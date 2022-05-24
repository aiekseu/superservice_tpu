import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:superservice_tpu/app/top_level_providers.dart';
import 'package:superservice_tpu/services/enums.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.calendar_today), title: const Text('Расписание'),),
          SalomonBottomBarItem(
              icon: const Icon(Icons.grid_view), title: const Text('Сервисы'),),
          SalomonBottomBarItem(
              icon: const Icon(Icons.person_outline), title: const Text('Профиль'),),
        ],
        currentIndex: ref.watch(activePage.state).state.index,
        onTap: (int index) {
          ref.watch(activePage.notifier).state = Pages.values[index];
        },
      ),
    );
  }
}
