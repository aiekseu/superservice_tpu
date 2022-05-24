import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/app/all_services/services_page.dart';
import 'package:superservice_tpu/app/profile/profile_page.dart';
import 'package:superservice_tpu/app/schedule/schedule_page.dart';
import 'package:superservice_tpu/app/top_level_providers.dart';
import 'package:superservice_tpu/services/enums.dart';
import 'package:superservice_tpu/widgets/bottom_nav_bar.dart';

import 'app/schedule/data/schedule_providers.dart';
import 'app/schedule/widgets/calendar_appbar.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _activePage = ref.watch(activePage.state).state;

    _getAppBar() {
      switch (_activePage) {
        case Pages.schedule:
          {
            final _pickedDate = ref.watch(pickedDateProvider.state);
            return CalendarAppBar(
              onDateChanged: (value) => _pickedDate.state = value,
              firstDate: DateTime.now().subtract(Duration(days: 14)),
              lastDate: DateTime.now().add(Duration(days: 30)),
              selectedDate: DateTime.now(),
              fullCalendar: false,
              white: Colors.white,
              black: Colors.black,
              accent: Colors.green,
              locale: 'ru',
            );
          }
        default:
          {
            return null;
          }
      }
    }

    _getBody() {
      switch (_activePage) {
        case Pages.allServices:
          {
            return ServicesPage();
          }
        case Pages.schedule:
          {
            return SchedulePage();
          }
        case Pages.profile:
          {
            return ProfilePage();
          }
        default:
          {
            return null;
          }
      }
    }

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: _getAppBar(),
        body: _getBody(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
