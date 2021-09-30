import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/app/all_services/all_services.dart';
import 'package:superservice_tpu/app/profile/profile_page.dart';
import 'package:superservice_tpu/app/schedule/schedule_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: 'schedule',
      routes: {
        'schedule': (_) => SchedulePage(),
        'profile': (_) => ProfilePage(),
        'services': (_) => ServicesPage(),
      },
    );
  }
}
